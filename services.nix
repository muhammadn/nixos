{ config, pkgs, ... }:
with (config.services // pkgs.lib );
let
    app = import ./app.nix { pkgs = pkgs; };
in
{
  services.openssh.enable = true; 
  services.nginx = {
       enable = true;
       httpConfig = ''
           access_log  /var/log/nginx/access.log;
           error_log  /var/log/nginx/error.log;

           server {
             listen  80; # just use standard http port, no ssl

             root ${app}/public;
             index index.php index.html index.htm;

             server_name zalora.mydomainname.com;
             access_log  /var/log/nginx/zalora.access.log;

             location / {
               try_files $uri $uri/ /index.php?$query_string;
             }

             error_page 404 /404.html;

             error_page 500 502 503 504 /50x.html;
             location = /50x.html {
                 root ${nginx.package}/html;
             }

             # pass the PHP scripts to FastCGI server listening on the php-fpm socket
             location ~ \.php$ {
                 try_files $uri /index.php =404;
                 fastcgi_pass unix:/var/run/php-fpm.sock;
                 fastcgi_index index.php;
                 fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                 include ${nginx.package}/conf/fastcgi_params;
             }
           }

      '';
  };

  systemd.services.nginx = {
    preStart = ''
      if ! test -e /var/log/nginx
         then mkdir -p /var/log/nginx
      fi
      if ! test -e /var/www
         then mkdir -p /var/www
      fi

      if [ $(stat -c %U /var/www) != "deploy" ]
        then chown deploy:deploy /var/www
      fi
    '';
  };

  services.phpfpm.poolConfigs = {
       www = '' 
        listen = /var/run/php-fpm.sock
        user = nginx
        listen.owner = nginx
        listen.group = nginx
        listen.mode = 0660
        pm = dynamic
        pm.max_children = 75
        pm.start_servers = 10
        pm.min_spare_servers = 5
        pm.max_spare_servers = 20
        pm.max_requests = 500 
      '';
  };

  services.mysql = { 
    enable = true;
    package = pkgs.mysql;
  };
}

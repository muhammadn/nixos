# NixOS Modules (LAMP with documentation to install sample zalora API app)
## These steps assume you already have an installed version of NixOS
1. Install git. `nix-env -i git` (since we need git to fetch the nixos configuration)
2. Run: `cd /etc; mv nixos nixos.orig`
3. In /etc directory, `git clone https://github.com/muhammadn/nixos.git`
4. As *root*, run `nixos-rebuild switch`

## Optional
### If you want to install sample API app for uploading,deleting files from here: [https://github.com/muhammadn/zalora](https://github.com/muhammadn/zalora)
1. As user _zaihan_ (or any user you have added), run `sudo -iu deploy'
2. Key in your user password when prompted
3. As *deploy* user, run: `cd /var/www && git clone https://github.com/muhammadn/zalora.git`
4. `cd /var/www/zalora && composer install && touch database/database.sqlite` as the *deploy* user.
5. In the same _zalora_ directory, run these command as *root* with `sudo -i`.
```chown -R nginx:nginx storage
   chown nginx:nginx database
   chown nginx:nginx database.sqlite
``` 

with import <nixpkgs> {};
{ pkgs ? import <nixpkgs> {} }:

stdenv.mkDerivation rec { 
  name = "zalora";

  src = pkgs.fetchgit {
    url = "git@github.com:muhammadn/zalora.git";
    sha256 = "0zwis7zrpsc8fqi21rd91x7jqphjbkdsb3hpidm5wigczs23dvf8";
  };

  buildInputs = [ php php70Packages.composer ];

  installPhase = ''
    mkdir -p /tmp/zalora/storage/app /tmp/zalora/storage/framework/cache /tmp/zalora/storage/framework/views /tmp/zalora/storage/logs /tmp/zalora/database
    touch /tmp/zalora/database/database.sqlite
    cp .env.sqlite .env
    chmod 777 /tmp/zalora/database /tmp/zalora/storage /tmp/zalora/storage/logs /tmp/zalora/storage/app /tmp/zalora/storage/framework /tmp/zalora/storage/framework/cache /tmp/zalora/database/database.sqlite
    composer install
    php artisan migrate
    mkdir -p $out
    cp -Rp * $out
    cp -Rp .env $out
  '';
}

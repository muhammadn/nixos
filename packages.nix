{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim 
     git  
     nginx 
     php
     mysql
     php70Packages.composer
  ];
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim 
     git  
     nginx 
  ];
}

# NixOS Modules (includes LAMP with automation to download and configure [zalora app](http://https://github.com/muhammadn/zalora))
## These steps assume you already have an installed version of NixOS
1. Install git. `nix-env -i git` (since we need git to fetch the nixos configuration)
2. Run: `cd /etc; mv nixos nixos.orig`
3. In /etc directory, `git clone https://github.com/muhammadn/nixos.git`
4. As *root*, run `nixos-rebuild switch`


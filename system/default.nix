{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./persist.nix
    ./locale.nix
    ./users.nix
    ./software.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}

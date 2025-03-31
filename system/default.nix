{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./persist.nix
    ./locale.nix
    ./users.nix
    ./software.nix
  ];

  system.stateVersion = "24.11";
}

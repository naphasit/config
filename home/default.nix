{ inputs, ... }:

{
  imports = [
    ./persist.nix
    ./hyprland.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

{ inputs, ... }:

{
  imports = [
    ./persist.nix
    ./gtk.nix
    ./xdg.nix
    ./hyprland.nix
    ./kitty.nix
    ./firefox
    ./software.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

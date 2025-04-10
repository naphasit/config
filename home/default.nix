{ inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./hyprland
    ./kitty
    ./xdg
    ./gtk
  ];

  home.persistence."/persist/home/naphasitng" = {
    directories = [];
    allowOther = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

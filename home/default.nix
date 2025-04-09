{ inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./hyprland
  ];

  home.persistence."/persist/home/naphasitng" = {
    directories = [];
    allowOther = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

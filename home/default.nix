{ inputs, home-manager, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./hyprland
    ./gtk
    ./kitty
    ./floorp
  ];

  home.persistence."/persist/home" = {
    directories = [
      ".floorp"
      ".mozilla"
    ];
    allowOther = true;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

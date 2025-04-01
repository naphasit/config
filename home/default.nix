{ inputs, home-manager, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./hyprland
    ./gtk
    ./kitty
    ./floorp
  ];

  home.persistence."/persist/home/naphasitng" = {
    allowOther = true;
    directories = [
      ".floorp"
      ".mozilla"
      ".steam/steam"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

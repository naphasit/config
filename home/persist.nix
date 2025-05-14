{ inputs, ... }:

{
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];

  home.persistence."/persist/home/naphasitng" = {
    directories = [
      ".mozilla"
      "Games"
      "Codes"
      ".local/share/PrismLauncher"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    allowOther = true;
  };
}

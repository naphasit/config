{ inputs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persist/home/naphasitng" = {
    directories = [
      ".mozilla"
      "Games"
      ".local/share/PrismLauncher"
    ];
    allowOther = true;
  };
}

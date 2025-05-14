{ inputs, pkgs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../home/system/hypr
    ../home/system/xdg
    ../home/system/gtk
    ../home/system/ags

    ../home/software/firefox
    ../home/software/kitty
  ];
  home = {
    persistence."/persist/home/naphasitng" = {
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

    packages = with pkgs; [ prismlauncher ];
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}

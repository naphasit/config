{ pkgs, ... }:

{
  xdg = {
    enable = true;
    desktopEntries = {
      nixos-manual = {
        name = "NixOs Manual";
        exec = "nixos-help";
        noDisplay = true;
      };
    };
    portal = {
      xdgOpenUsePortal = true;
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}

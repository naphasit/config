{ pkgs, ... }:

{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  gtk = {
    enable = true;

    # theme = {
    #   package = pkgs.whitesur-gtk-theme;
    #   name = "Adwaita";
    # };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      package = pkgs.adwaita-fonts;
      name = "Adwaita Sans";
      size = 11;
    };
  };
}

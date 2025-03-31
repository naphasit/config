{ pkgs, ... }:

{
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

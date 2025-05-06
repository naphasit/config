{ inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      napasitng = {
	      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
        ];
      };
    };
  };

  home.file.".mozilla/firefox/napasitng/user.js" = {
    source = ./user.js;
    recursive = true;
    force = true;
  };
}

{ config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = with config.design.color; {
      background = "#151515";
      background_opacity = 0.4;
      foreground = "#eeeeee";
      selection_foreground = "#151515";
      selection_background = "#eeeeee";

      window_margin_width = 8;

      color0 = "#151515";
      color8 = "#353535";
      color1 = "#aa1818";
      color9 = "#dd4545";
      color2 = "#18aa18";
      color10 = "#45dd45";
      color3 = "#aaaa18";
      color11 = "#dddd45";
      color4 = "#1818aa";
      color12 = "#4545dd";
      color5 = "#aa18aa";
      color13 = "#dd45dd";
      color6 = "#18aaaa";
      color14 = "#45dddd";
      color7 = "#aaaaaa";
      color15 = "#eeeeee";

      cursor = "#eeeeee";
      cursor_shape = "beam";
      cursor_trail = 1;

      confirm_os_window_close = 0;
    };
  };
}

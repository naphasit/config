{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    settings = {
      monitor = ", preferred, auto, 1.2";

      exec-once = [
        "ags run --gtk4"
        "systemctl start --user polkit-gnome-authentication-agent-1"
      ];

      "xwayland:force_zero_scaling" = true;

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;

        "col.active_border" = "rgba(70707040)";
        "col.inactive_border" = "rgba(70707040)";

        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 24;
        rounding_power = 2;

        active_opacity = 1;
        inactive_opacity = 1;

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 2;
          passes = 6;
          noise = 1.17e-2;
          contrast = 0.97;

          vibrancy = 0;
        };
      };

      animations = {
        enabled = true;
        first_launch_animation = false;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInQuint,0.64, 0, 0.78, 0"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global, 1, 10, default"

          "windows, 1, 4.5, easeOutQuint"
          "windowsIn, 1, 3.5, easeOutQuint, popin 75%"
          "windowsOut, 1, 1.5, easeInQuint, popin 75%"
          "windowsMove, 1, 3.5, easeOutQuint"

          "layers, 1, 4.5, easeOutQuint"
          "layersIn, 1, 3.5, easeOutQuint, fade"
          "layersOut, 1, 1.5, easeInQuint, popin"

          "fade, 1, 4.5, quick"
          "fadeIn, 1, 3.5, easeOutQuint"
          "fadeOut, 1, 1.5, easeInQuint"
          "fadeLayersIn, 1, 3.5, easeOutQuint"
          "fadeLayersOut, 1, 1.5, easeInQuint"

          "workspaces, 1, 3.5, easeOutQuint, slide"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us, th";
	kb_options =  "grp:alt_space_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = { natural_scroll = false; };
      };

      gestures = { workspace_swipe = true; };

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $FileManager" # Add File Manager Later
        "$mod, V, togglefloating"
        "$mod, R, exec, ags toggle AppLauncher"
        "$mod, F, fullscreen"
        "$mod, J, togglesplit"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ] ++ (builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ]) 9));

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ -l 1"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- -l 1"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      layerrule = [
        "blur, Bar"
        "ignorezero, Bar"
        "blur, AppLauncher"
        "ignorezero, AppLauncher"
        "blur, QuickSettings"
        "ignorezero, QuickSettings"
      ];
    };
  };
}

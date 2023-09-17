{ inputs, pkgs, ... }: {

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enable = true;
    # enabled in nixos/programs/default to add proper support
    # desktop entry, xdg portals, target, polkit, etc.
    # I haven't been able to do this by enabling only in hm.
    # But it doesn't really matter as the hash is the same, so not
    # installed twice or anything silly like that :D
    systemdIntegration = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";
      env = "XCURSOR_SIZE,72";

      exec-once = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "dunst"
        "swww init"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard regular --all-mime-type-regex '(?i)^(?!(?:image|audio|video|font|model)/).+' --selection-size-limit 1048576"
        "mpd-notification"
      ];

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      "$mainMOD" = "SUPER";
      "$term" = "kitty";
      "$web_browser" = "firefox";

      bind = [
        # applications
        "$mainMOD, Return, exec, $term"
        "$mainMOD, B, exec, $web_browser"
        "$mainMOD, E, exec, nautilus"

        # utilities
        "$mainMOD, space, exec, sh $HOME/.config/rofi/bin/launcher"
        "$mainMOD, T, exec, pkill -SIGUSR1 waybar"
        "$mainMOD, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # hyprland
        "CTRLALT, Delete, exit, "
        "$mainMOD, C, killactive, "
        "$mainMOD, Tab, cyclenext, " # cycle windows
        "$mainMOD, Tab, bringactivetotop, " # cycle in floating workspace

        "$mainMOD, F, fullscreen, "
        "$mainMOD, S, togglefloating, " # make window floating
        "$mainMOD SHIFT, S, exec, hyprctl dispatch workspaceopt allfloat" # make all windows float
        "$mainMOD, P, pseudo, " # dwindle
        "$mainMOD, O, toggleopaque, " # toggle opacity for singular window

        # audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        # brightness
        ", XF86MonBrightnessUp, exec, light -A 5"
        ", XF86MonBrightnessDown, exec, light -U 5"
        # music
        ", XF86AudioPlay, exec, mpc toggle"
        ", XF86AudioPrev, exec, mpc prev"
        ", XF86AudioNext, exec, mpc next"

        # focus
        "$mainMOD, h, movefocus, l"
        "$mainMOD, j, movefocus, r"
        "$mainMOD, k, movefocus, u"
        "$mainMOD, l, movefocus, d"
        "$mainMOD SHIFT, h, swapwindow, l"
        "$mainMOD SHIFT, j, swapwindow, r"
        "$mainMOD SHIFT, k, swapwindow, u"
        "$mainMOD SHIFT, l, swapwindow, d"

        # workspaces
        "$mainMOD, 1, workspace, 1"
        "$mainMOD, 2, workspace, 2"
        "$mainMOD, 3, workspace, 3"
        "$mainMOD, 4, workspace, 4"
        "$mainMOD, 5, workspace, 5"
        "$mainMOD SHIFT, 1, movetoworkspace, 1"
        "$mainMOD SHIFT, 2, movetoworkspace, 2"
        "$mainMOD SHIFT, 3, movetoworkspace, 3"
        "$mainMOD SHIFT, 4, movetoworkspace, 4"
        "$mainMOD SHIFT, 5, movetoworkspace, 5"
      ];

      # mouse
      bindm = [
        "SUPER, mouse:272, movewindow" # <SUPER-LMB> moves windows
        "ALT, mouse:272, resizewindow" # <ALT-LMB> resizes windows
      ];

      general = {
        layout = "dwindle";
        apply_sens_to_raw = 0; # whether to apply sensitivity to raw input (e.g. used by games where you aim with mouse)
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgb(b4befe)";
        "col.inactive_border" = "rgb(1e1e2e)";
      };

      decoration = {
        rounding = 10;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
        };
      };

      # blur behind waybar
      # blurls = "waybar";

      animations = {
        enabled = true;
        bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
        animation = [
          "windows, 1, 4, overshot, slide"
          "fade, 1, 7, default"
          "workspaces, 1, 8.8, overshot, slide"
          "border, 1, 14, default"
        ];
      };

      dwindle = {
        pseudotile = true; # bound to mainMOD + P
        preserve_split = true;
        no_gaps_when_only = 2; # default:disabled - 0, no border - 1, with border - 2
      };

      master = {
        new_is_master = true;
        no_gaps_when_only = 2;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      windowrule = [
        ""
      ];

      windowrulev2 = [
        # 'opacity float float' (sets active inactive)
        # can add "override" after a float to make it override instead of a multiplier (not sure what this means haha...)  
        "opacity 1.0 0.5, floating:1" # gives inactive floating windows 0.5 opacity
        "opacity 1.0, class:^(kitty)$" # don't change kitty opacity

        "float, class:^(xdg-desktop-portal-gtk)$"
        "float, class:^(blueman-manager)$"
        "float, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "float, class:^(org.gnome.Nautilus)$"

      ];

    };
  };
}

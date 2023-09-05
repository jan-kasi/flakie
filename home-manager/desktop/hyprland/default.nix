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
        "mako"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard regular --all-mime-type-regex '(?i)^(?!(?:image|audio|video|font|model)/).+' --selection-size-limit 1048576"
        "swww init"
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
      "$drun" = "tofi-drun | xargs hyprctl dispatch exec --";

      bindr = [
        "SUPER, SUPER_L, exec, pkill tofi || $drun"
      ];
      bind = [
        "$mainMOD, Return, exec, $term"
        "SUPER,space,exec,wofi --show drun"
        "$mainMOD, C, killactive, "
        "$mainMOD, V, exec, cliphist list | tofi | cliphist decode | wl-copy"
        "$mainMOD, F, togglefloating, "
        "$mainMOD, P, pseudo, " # dwindle

        # To switch between windows in a floating workspace
        "$mainMOD, Tab, cyclenext, "
        "$mainMOD, Tab, bringactivetotop, "

        "$mainMOD, E, exec, nautilus"
        "$mainMOD, B, exec, firefox"

        "CTRLALT, Delete, exit, "

        ", XF86AudioRaiseVolume, exec, wpctl set-volume 59 0.02+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume 59 0.02-"
        ", XF86AudioMute, exec, wpctl set-mute 59 toggle"

        ", XF86AudioPlay, exec, mpc toggle"
        ", XF86AudioPrev, exec, mpc prev"
        ", XF86AudioNext, exec, mpc next"

      ];
      bindm = [
        "SUPER, mouse:272, movewindow" # <SUPER-LMB> moves windows
        "ALT, mouse:272, resizewindow" # <ALT-LMB> resizes windows
      ];

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        drop_shadow = false;

        blur = {
          enabled = true;
          size = 2;
          passes = 3;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true; # bound to mainMOD + P
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

    };
  };
}

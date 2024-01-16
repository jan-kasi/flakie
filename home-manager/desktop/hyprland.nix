# { inputs, pkgs, ... }: {
{ pkgs, ... }: {
  xdg.configFile."hypr/gamemode.sh".source = ./hypr/gamemode.sh;
  xdg.configFile."hypr/shaders/vibrance.glsl".source = ./hypr/shaders/vibrance.glsl;
  xdg.configFile."hypr/shaders/blue-light-filter.glsl".source = ./hypr/shaders/blue-light-filter.glsl;
  xdg.configFile."hypr/shaders/crt.frag".source = ./hypr/shaders/crt.frag;

  wayland.windowManager.hyprland = {
    # not using flake for hyprland, only nixpkgs release
    # if using flake again also uncomment in nixos/programs/default.nix
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    enable = true;
    # enabled in nixos/programs/default to add proper support
    # desktop entry, xdg portals, target, polkit, etc.
    # The hash is the same, so not installed twice or anything silly like that :D

    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";
      env = "XCURSOR_SIZE,72";

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment PATH" # should be covered by systemd.user.extraConfig
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        # "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "dunst"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard regular --selection-size-limit 1048576"
        "mpd-notification"
        "swww init && $HOME/.local/bin/lastswww.sh"
      ];

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
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
        ", Print, exec, grimblast --notify copysave screen"
        "SHIFT, Print, exec, grimblast --notify copysave area"
        "$mainMOD, F1, exec, sh $HOME/.config/hypr/gamemode.sh"

        # hyprland
        "CTRLALT, Delete, exit, "
        "$mainMOD, BackSpace, exec, swaylock"
        "$mainMOD, Q, killactive, "

        "$mainMOD, Tab, cyclenext, " # cycle windows
        "$mainMOD, Tab, bringactivetotop, " # cycle in floating workspace
        "$mainMOD, Tab, changegroupactive"

        "$mainMOD, F, fullscreen, "
        "$mainMOD, S, togglefloating, " # make window floating
        "$mainMOD SHIFT, S, exec, hyprctl dispatch workspaceopt allfloat" # make all windows float
        "$mainMOD, P, pseudo, " # dwindle
        "$mainMOD, G, togglegroup"

        "$mainMOD SHIFT, C ,exec, hyprpicker -a"

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

      bindl = [
        # audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        # brightness
        ", XF86MonBrightnessUp, exec, light -A 1"
        ", XF86MonBrightnessDown, exec, light -U 1"
        # music
        ", XF86AudioPlay, exec, mpc toggle"
        ", XF86AudioPrev, exec, mpc prev"
        ", XF86AudioNext, exec, mpc next"
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
        border_size = 1;
        "col.active_border" = "rgb(bac2f8)";
        "col.inactive_border" = "rgb(1e1e2e)";
      };

      group = {
        "col.border_active" = "rgb(a6e3a1)";
        "col.border_locked_active" = "rgb(fab387)";
        "col.border_inactive" = "rgb(1e1e2e)";
        "col.border_locked_inactive" = "rgb(f9e2af)";
        groupbar = {
          font_size = 12;
          text_color = "rgb(b4befe)";
          gradients = false;
          render_titles = true;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";

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
        no_gaps_when_only = 0; # default:disabled - 0, no border - 1, with border - 2
      };

      master = {
        new_is_master = true;
        no_gaps_when_only = 0;
      };

      gestures = {
        workspace_swipe = true;
      };

      windowrulev2 = [
        # 'opacity float float' (sets active inactive)
        # can add "override" after a float to make it override instead of a multiplier (not sure what this means haha...)  
        "float, class:^(xdg-desktop-portal-gtk)$"
        "float, class:^(blueman-manager)$"
        "float, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "float, class:^(firefox)$, title:^(Library)$"
        "float, class:^(org.gnome.Nautilus)$"
        "float, class:^(anki)$"
        "float, class:^(transmission-gtk)$"
      ];

    };
  };
}

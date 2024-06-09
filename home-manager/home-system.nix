{ inputs, outputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.newm-atha

      # overlays exported from other flakes
      # inputs.nix-alien.overlays.default
    ];

    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "jankasi";
    homeDirectory = "/home/jankasi";
    sessionPath = [ "$HOME/.config/emacs/bin" ];

    sessionVariables = {
      DEFAULT_BROWSER = "firefox";
      TERMINAL = "alacritty";
      TERM = "alacritty";
    };

    file.".profile".text = ''
      #!/usr/bin/env dash
      if [ $XDG_SESSION_TYPE=wayland ]; then
        export QT_SCALE_FACTOR=1
        export QT_QPA_PLATFORM=wayland
        export MOZ_ENABLE_WAYLAND=1
        dbus-update-activation-environment --systemd --all
      elif [ $XDG_SESSION_TYPE=xcb ]; then
        export QT_QPA_PLATFORM=xcb
        export MOZ_ENABLE_WAYLAND=0
        dbus-update-activation-environment --systemd --all
      elif [ $XDG_SESSION_TYPE=x11 ]; then
        export QT_QPA_PLATFORM=x11
        export MOZ_ENABLE_WAYLAND=0
        dbus-update-activation-environment --systemd --all
      fi
    '';

    shellAliases = {
      l = "eza --icons";
      ll = "eza --icons -lagh";
      lt = "eza --icons -TL";
    };

    pointerCursor = {
      # name = "material_light_cursors";
      # package = pkgs.material-cursors;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };
  };

  fonts.fontconfig.enable = true;

  xdg.userDirs.extraConfig = {
    XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory/Pictures/Screenshots}";
  };

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

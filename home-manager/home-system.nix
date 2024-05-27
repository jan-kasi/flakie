{ inputs, outputs, pkgs, ... }: {
  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.newm-atha

      # overlays exported from other flakes
      inputs.nix-alien.overlays.default
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
      DEFAULT_BROWSER = "qutebrowser";
      TERMINAL = "alacritty";
      TERM = "alacritty";
    };

    shellAliases = {
      l = "eza --icons";
      ll = "eza --icons -lagh";
      lt = "eza --icons -TL";
    };

    pointerCursor = {
      # name = "material_light_cursors";
      # package = pkgs.material-cursors;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
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

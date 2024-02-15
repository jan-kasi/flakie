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
      DEFAULT_BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    shellAliases = {
      l = "eza --icons";
      ll = "eza --icons -lagh";
      lt = "eza --icons -TL";
    };
  };

  fonts.fontconfig.enable = true;
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    # fonts #
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    # icons
    symbola
    font-awesome
    feather-icon-font # custom
    # nerdfonts
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    meslo-lgs-nf
  ];

  xdg.userDirs.extraConfig = {
    XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory/Pictures/Screenshots}";
  };

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

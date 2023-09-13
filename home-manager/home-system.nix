{ inputs, outputs, ... }: {
  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.newm-atha

      # overlays exported from other flakes
      inputs.nix-alien.overlay
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
      EDITOR = "hx";
      DEFAULT_BROWSER = "firefox";
    };

    shellAliases = {
      l = "exa --icons";
      ll = "exa --icons -lagh";
      lt = "exa --icons -TL";
    };
  };

  xdg.mime.enable = true;
  xdg.mimeApps.defaultApplications = [

  ];

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

{ inputs, outputs, ... }:
{  
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

  home.username = "jankasi";
  home.homeDirectory = "/home/jankasi";

  home.shellAliases = {
    l = "exa --icons";
    ll = "exa --icons --lagh";
    lt = "exa --icons -TL";
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let home-manager install and manage itself
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

{ pkgs, ... }: {

  programs.eww = {
    enable = false;
    package = pkgs.eww;
    # configDir = ./eww-config-dir;
  };
}

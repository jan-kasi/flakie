{ pkgs, ... }: {
  home.packages = with pkgs; [ nautilus file-roller nautilus-open-any-terminal sushi adwaita-icon-theme ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [ gnome.nautilus gnome.file-roller nautilus-open-any-terminal gnome.sushi pantheon.elementary-icon-theme ];
}

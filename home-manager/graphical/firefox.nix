{ pkgs, ... }: {
  # TODO Nix User Repository NUR
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox.override {
      cfg = {
        # Tridactyl native connector
        enableTridactylNative = true;
      };
    };
  };
}

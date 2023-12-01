{ pkgs, ... }: {
  # TODO Nix User Repository NUR
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [ pkgs.tridactyl-native ];
    };
  };
}

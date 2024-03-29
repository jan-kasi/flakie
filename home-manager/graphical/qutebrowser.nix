{ pkgs, lib, ... }: {

  programs.qutebrowser.enable = true;
  greasemonkey = [
    (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/parchd-1/qutebrowser-zotero/master/qute-zotero";
      sha256 = lib.fakeHash;
    })
    # (pkgs.fetchurl {
    #   url = "https://raw.githubusercontent.com/afreakk/greasemonkeyscripts/master/youtube_sponsorblock.js";
    #   sha256 = lib.fakeHash;
    # })
  ];

  programs.qutebrowser.keyBindings = {
    normal = {
      ",m" = "spawn umpv {url}";
      ",M" = "hint links spawn umpv {hint-url}";
      ";M" = "hint links --rapid links spawn umpv {hint-url}";
      ",z" = "spawn --userscript zotero";
      ",Z" = "hint links userscript zotero";
    };
  };

  programs.qutebrowser.searchEngines = {
    nixos = "https://search.nixos.org/options?channel=unstable&query={}";
    nixpkgs = "https://search.nixos.org/packages?channel=unstable&query={}";
    hmop = "https://home-manager-options.extranix.com/?query={}&release=master";
    torrentz2 = "https://torrentz2.nz/search?q={}";
  };

  # quickmarks = {};
  settings = { tabs.last_close = "close"; };
  programs.qutebrowser.extraConfig = ''
    import os
    from urllib.request import urlopen

    # load your autoconfig, use this, if the rest of your config is empty!
    # config.load_autoconfig()

    if not os.path.exists(config.configdir / "theme.py"):
       theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
       with urlopen(theme) as themehtml:
            with open(config.configdir / "theme.py", "a") as file:
                 file.writelines(themehtml.read().decode("utf-8"))

    if os.path.exists(config.configdir / "theme.py"):
       import theme
       theme.setup(c, 'mocha', True)
  '';

}

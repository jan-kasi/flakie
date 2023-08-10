{ config, pkgs, inputs, lib, ... }:

{  
  home.username = "jankasi";
  home.homeDirectory = "/home/jankasi";
  home.stateVersion = "23.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  systemd.user.startServices = "sd-switch"; # Nicely reload system units when changing configs

  ## Configure nixpkgs ##
  nixpkgs = {
    config = {
      allowUnfree = true; 
      allowUnfreePredicate = (_: true);
    };
   # >>> (if you switch to standard-based starter flake add overlays here) <<< #
  };

  ## Let home-manager install and manage itself ##
  programs.home-manager.enable = true;
  
  # # # # # # # # # # # # # # # # # # # # # #
  # Add stuff for your user as you see fit. #
  # # # # # # # # # # # # # # # # # # # # # #

  # Session variables 
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Shell Aliases #
  home.shellAliases = {
    l = "exa";
    ll = "exa -la";
    cat = "bat";
  };

  # >>>>>>>>>>>>>><<<<<<<<<<<<<< #
  # packages to install for user #
  # >>>>>>>>>>>>>><<<<<<<<<<<<<< #
  home.packages = with pkgs; [
    fzf
    fd
    exa
    grc
    ripgrep
    jq
    meslo-lg
    meslo-lgs-nf
    mullvad-vpn
    transmission-gtk
  ];

  # Kitty terminal emulator
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    theme = "Dracula";
    font.name = "Meslo LGS NF";
  };
  
  # Fish shell
  programs.fish = {
    enable = true;
    plugins = [  
      # Enable a plugin from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "foreign-env"; src = pkgs.fishPlugins.foreign-env.src; }  
      # Manually packaging and enabling a plugin
      { 
        name = "dracula";
        src = pkgs.fetchFromGitHub {
	  owner = "dracula";
	  repo = "fish";
	  # You can find the latest git commit hash with
	  # '$ git ls-remote $URL HEAD'
	  rev = "269cd7d76d5104fdc2721db7b8848f6224bdf554";
	  # To update this after changing rev/url/etc empty 'sha256 = "";'
	  # Replace with sha "got" by error output (just copy paste all of it)
	  sha256 = "sha256-Hyq4EfSmWmxwCYhp3O8agr7VWFAflcUe8BUKh50fNfY=";
        };
      }
    ];
  };

  # Neovim  
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  # bat (cat clone)
  programs.bat = {
    enable = true;
    themes = {
      dracula = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "sublime"; # Bat uses sublime syntax for its themes
        rev = "c5de15a0ad654a2c7d8f086ae67c2c77fda07c5f";
        sha256 = "sha256-m/MHz4phd3WR56I5jfi4hMXnFf4L4iXVpMFwtd0L0XE=";
      } + "/Dracula.tmTheme");
    };
    config.theme = "Dracula";
    config.pager = "less -FR";
  };

  # Git
  programs.git = {
    enable = true;
    userName = "jan-kasi";
    userEmail = "77466026+jan-kasi@users.noreply.github.com";
  };

    # Firefox
  programs.firefox = {
    enable = true;
  };

  ## You can import other home-manager modules here ##
  imports = [ ];
}

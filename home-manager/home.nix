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
   # >>> (if you switch to add overlays here) <<< #
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
    l = "exa --icons";
    ll = "exa --icons -lagh";
    lt = "exa --icons -TL";
  };

  # >>>>>>>>>>>>>><<<<<<<<<<<<<< #
  # packages to install for user #
  # >>>>>>>>>>>>>><<<<<<<<<<<<<< #
  home.packages = with pkgs; [
    fd
    exa
    grc
    ripgrep
    jq
    meslo-lgs-nf
    mullvad-vpn
    transmission-gtk
    logseq
    bottles
    steam-tui
    glow
    fff
    bottom
    ikill
  ];

  # Kitty terminal emulator
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    theme = "Catppuccin-Mocha";
    font.name = "Meslo LGS NF";
    settings = {
      allow_remote_control = "yes";
      dynamic_background_opacity = "yes";
      focus_follows_mouse = "yes";
      draw_minimal_borders = "yes";
      bell_border_color = "#ff5555";
      mouse_hide_wait = "3";
      inactive_text_alpha = "0.7";
      window_padding_width = "1";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
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

  # Fish shell
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nurl = "nix run nixpkgs#nurl ";
    };
    interactiveShellInit = ''
      starship init fish | source
    '';
    plugins = [
      # Enable a plugin from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "foreign-env"; src = pkgs.fishPlugins.foreign-env.src; }  

      # Manually packaging and enabling a plugin
      
      # Catppuccin with following perhaps?
      # { name = "Catppuccin-Mocha";
      #  src = builtins.readFile();
      # }
      
      #{ name = "dracula";
      #  src = pkgs.fetchFromGitHub {
      #	  owner = "dracula";
      #	  repo = "fish";
      #	  # You can find the latest git commit hash with
      #   # '$ git ls-remote $URL HEAD'
      #	  rev = "269cd7d76d5104fdc2721db7b8848f6224bdf554";
      #	  # To update this after changing rev/url/etc empty 'sha256 = "";'
      #	  # Replace with sha "got" by error output (just copy paste all of it)
      #	  sha256 = "sha256-Hyq4EfSmWmxwCYhp3O8agr7VWFAflcUe8BUKh50fNfY=";
      #  };
      # }
    ];
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # Neovim  
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  # Helix
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.helix;
  };

  # Bat (cat clone)
  programs.bat = {
    enable = true;
    config.theme = "Catppuccin-Mocha";
    config.pager = "less -FR";
    themes = {
      dracula = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "sublime"; # Bat uses sublime syntax for its themes 
	rev = "c5de15a0ad654a2c7d8f086ae67c2c77fda07c5f"; 
	sha256 = "sha256-m/MHz4phd3WR56I5jfi4hMXnFf4L4iXVpMFwtd0L0XE="; 
	}+ "/Dracula.tmTheme");
      Catppuccin-Mocha = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "catppuccin";
	repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";	
	}+ "/Catppuccin-mocha.tmTheme");
    };
  };

  # fzf
  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
    defaultOptions = [
      "--ansi"
      "--preview-window 'right:60%'"
      "--preview 'bat --color=always --style=header,grid --line-range :300 {}'"];
    colors = {
      fg = "#f8f8f2";
      bg = "#282a36";
      hl = "#bd93f9";
      "fg+" = "#f8f8f2";
      "bg+" = "#44475a";
      "hl+" = "#bd93f9";
      info = "#ffb86c";
      prompt = "#50fa7b";
      pointer = "#ff79c6";
      marker = "#ff79c6";
      spinner = "#ffb86c";
      header = "#6272a4";
    };
  };

  ## You can import other home-manager modules here ##
  imports = [ ];
}

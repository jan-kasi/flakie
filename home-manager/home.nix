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
    steamPackages.steamcmd
    steam-tui
    glow
    bottom
    ikill
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "jan-kasi";
    userEmail = "77466026+jan-kasi@users.noreply.github.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      init.defaultBranch = "main";
    };
  };

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
  
  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    extraConfig = ''
     $term = kitty

     bind=SUPER,Return,exec,$term
     bind=CTRLALT,Delete,exit,
    '';
  };

  # Firefox
  programs.firefox = {
    enable = true;
  };
  
  # Qutebrowser
  #programs.qutebrowser = {
  #  enable = true;
  #  keyBindings = {
  #    normal = {
  #      ",m" = "spawm umpv {url}";
  #	",M" = "hint links spawn umpv {hint-url}";
  #      ";M" = "hint --rapid links spawn umpv {hint-url}";
  #    };
  #  };
  #  searchEngines = {
  #    DEFAULT = "https://www.ecosia.org/search?method=index&q={}";
  #    "!d" = "https:www.duckduckgo.com/?q={}";
  #    "!fg" = "https://fitgirl-repacks.site/?s={}";
  #    "!fh" = "https://flathub.org/apps/search?q={}";
  #    "!gr" = "https://www.goodreads.com/search?q={}";
  #    "!np" = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
  #    "!no" = "https://search.nixos.org/options?channel=unstable&size=50&sort=relevance&type=packages&query={}";
  #    "!hm" = "https://mipmip.github.io/home-manager-option-search/?query={}";
  #  };
  #  settings = {
  #    url.start_pages = "qute://bookmarks";
  #    url.default_page = "qute://bookmarks";
  #  };
  #  extraConfig = 
  #  ''
  #  import os
  #  from urllib.request import urlopen
  #
  #  # load your autoconfig, use this, if the rest of your config is empty!
  #  config.load_autoconfig()
  #
  #  if not os.path.exists(config.configdir / "theme.py"):
  #      theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
  #      with urlopen(theme) as themehtml:
  #          with open(config.configdir / "theme.py", "a") as file:
  #              file.writelines(themehtml.read().decode("utf-8"))
  #
  #  # choose the catppuccin flavour you'd like!
  #  # valid options are 'latte', frappe', 'machiatto' and 'mocha'
  #  if os.path.exists(config.configdir / "theme.py"):
  #      import theme
  #      theme.setup(c, 'mocha', True)
  #  '';
  #};

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
  programs.starship = 
    let
      flavour = "mocha"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
    in
    {
      enable = true;
      enableFishIntegration = true;
      settings = {
        # Other config here
        format = "$all"; # Remove this line to disable the default prompt format
        palette = "catppuccin_${flavour}";
      } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/${flavour}.toml));
    };

  # TMUX
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "emacs";
    plugins = with pkgs; [
      { plugin = tmuxPlugins.tmux-fzf; }
      {
        plugin = tmuxPlugins.catppuccin;
	extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
    ];
  };

  # MPV
  programs.mpv = {
    enable = true;
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
    extraPackages = with pkgs.bat-extras; [ batdiff batman batpipe ];
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
      "--preview 'bat --color=always --style=header,grid --line-range :200 {}'"];
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

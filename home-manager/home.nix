{ config, pkgs, inputs, lib, ... }:

{
  home.username = "jankasi";
  home.homeDirectory = "/home/jankasi";
  home.stateVersion = "23.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  systemd.user.startServices = "sd-switch"; # Nicely reload system units when changing configs

  ## Configure nixpkgs ##
  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = (_: true);

    # >>> (if you want add overlays here) <<< #
    overlays = [
      inputs.nix-alien.overlay

      (final: prev: {
        steam-tui = final.steam-tui.overrideAttrs (oldAttrs: {
          version = "git";
          src = prev.fetchFromGitHub {
            owner = "dmadisetti";
            repo = "steam-tui";
            rev = "48bcd094b5b77336e20cc357d9172825475537e4";
            sha256 = "sha256-KLf8gMbgt4UstiNGbMW7BnyQJPqP2uL2+0gIdwRYV3w=";
          };
        });
      })
    ];


  };

  ## Let home-manager install and manage itself ##
  programs.home-manager.enable = true;

  # # # # # # # # # # # # # # # # # # # # # #
  # Add stuff for your user as you see fit. #
  # # # # # # # # # # # # # # # # # # # # # #

  # Session variables 
  home.sessionVariables = {
    EDITOR = "hx";
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
    cool-retro-term
    glow
    catimg
    bottom
    ikill
    nixd
    nixpkgs-fmt
    marksman
    nix-alien
    goldberg-emu
    yt-dlp
    mpc-cli
    mpd-notification
    # miniplayer
    cbonsai
    cli-visualizer
    cava
    python311Packages.requests # for beets fetchart
    python311Packages.pylast # for beets lastgenre
    pms
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "jan-kasi";
    userEmail = "77466026+jan-kasi@users.noreply.github.com";
    extraConfig = {
      core = {
        editor = "hx";
      };
      init.defaultBranch = "main";
    };
  };

  # Kitty terminal emulator
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
#    theme = "Catppuccin-Mocha";
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
    extraConfig = ''
      include /home/jankasi/.config/kitty/current-theme.conf
    '';
  };

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    extraConfig = ''
      preload = ~/Pictures/nix-wallpaper-nineish.png
      monitor=,preferred,auto,auto
      # env = XCURSOR_SIZE,24
      input {
        kb_layout = gb
        follow_mouse = 1
        touchpad {
          natural_scroll = true
        }
      }
      general {
        
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
      
        layout = dwindle
      }
      decoration {
        rounding = 10
        blur {
          enabled = true
          size = 3
          passes =1 
        }
        drop_shadow = false
      }
      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }
      dwindle {
        pseudotile = true # bound to mainMOD + P
        preserve_split = true
      }
      master {
        new_is_master = true
      }
      gestures {
        workspace_swipe = false
      }
      
      $mainMOD = SUPER
      $term = kitty
      
      bind = $mainMOD, Return, exec, $term
      bind = $mainMOD, C, killactive,
      bind = $mainMOD, E, exec, nautilus
      bind = $mainMOD, F, togglefloating,
      bind = $mainMOD, P, pseudo, # dwindle
      
      bind = CTRLALT,Delete,exit,
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
      neofetch = "nix run nixpkgs#neofetch";
    };
    functions = {
      fish_greeting = ''
        cbonsai -p
      '';
    };
    # Manually doing Catppuccin Mocha theme
    # shellInit = ''
      # set -g fish_color_normal cdd6f4
      # set -g fish_color_command 89b4fa
      # set -g fish_color_param f2cdcd
      # set -g fish_color_keyword f38ba8
      # set -g fish_color_quote a6e3a1
      # set -g fish_color_redirection f5c2e7
      # set -g fish_color_end fab387
      # set -g fish_color_comment 7f849c
      # set -g fish_color_error f38ba8
      # set -g fish_color_gray 6c7086
      # set -g fish_color_selection --background=313244
      # set -g fish_color_search_match --background=313244
      # set -g fish_color_option a6e3a1
      # set -g fish_color_operator f5c2e7
      # set -g fish_color_escape eba0ac
      # set -g fish_color_autosuggestion 6c7086
      # set -g fish_color_cancel f38ba8
      # set -g fish_color_cwd f9e2af
      # set -g fish_color_user 94e2d5
      # set -g fish_color_host 89b4fa
      # set -g fish_color_host_remote a6e3a1
      # set -g fish_color_status f38ba8
      # set -g fish_pager_color_progress 6c7086
      # set -g fish_pager_color_prefix f5c2e7
      # set -g fish_pager_color_completion cdd6f4
      # set -g fish_pager_color_description 6c7086
    # '';

    interactiveShellInit = ''
      starship init fish | source
    '';
    plugins = [
      # Enable a plugin from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "foreign-env"; src = pkgs.fishPlugins.foreign-env.src; }
      { name = "z"; src = pkgs.fishPlugins.z.src; }

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
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$line_break"
        "$character"
      ];
      right_format = lib.concatStrings [
        "$cmd_duration"
        "$time"
        "$os"
        "$nix_shell"
        "$python"
      ];
      directory = {
        home_symbol = "~";
        style = "blue";
        fish_style_pwd_dir_length = 1;
        truncation_length = 3;
      };
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "";
        untracked = "";
        modified = "";
        staged = "";
        renamed = "";
        deleted = "";
        ahead = "⇡";
        behind = "⇣";
        stashed = "≡";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      nix_shell = {
        heuristic = false;
        impure_msg = "[X](bold red)";
        pure_msg = "[P](bold green)";
        unknown_msg = "[?](bold yellow)";
        format = "via [☃️ $state( \($name\))](bold blue)";
      };
      python = {
        format = "[$virtualenv]($style) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      time = {
        disabled = false;
        style = "bold red";
      };
      os = {
        disabled = false;
        format = "[$symbol]($style) ";
      };
    };
  };

  # MPV
  programs.mpv = {
    enable = true;
  };

  # MPD the Music Player Daemon
  services.mpd = {
    enable = true;
    musicDirectory = "/home/jankasi/Music/";
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "MPD PipeWire Output"
      }
      audio_output {
        type   "fifo"
        name   "my_fifo"
        path   "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };
  # mpDris2, MPD to MPRIS2 bridge
  services.mpdris2.enable = true;

  # Beets music library manager
  programs.beets = {
    enable = true;
    package = pkgs.beets-unstable;
    settings = {
      plugins = "duplicates missing edit lastgenre fetchart mpdupdate fish random info";
      directory = "~/Music";
      library = "~/Music/musiclibrary.db";
      import = {
        move = true;
      };
      ui = {
        color = true;
        colors = {
          text_success = "green";
          text_warning = "yellow";
          text_error = "red";
          text_highlight_minor = "lightgray";
          action_default = "turquoise";
          action = "blue";
        };
      };
    };
  };

  # NCMPCPP an NCurses MPD client
  programs.ncmpcpp = {
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    enable = true;
    mpdMusicDir = "/home/jankasi/Music";
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      visualizer_fps = "60";
      visualizer_look = "▮●";
      visualizer_type = "ellipse";
      playlist_show_remaining_time = "yes";
      playlist_shorten_total_times = "yes";
      discard_colors_if_item_is_selected = "yes";
      incremental_seeking = "yes";
      seek_time = "2";
      volume_change_step = "10";
      progressbar_look = "─╼ ";
      progressbar_color = "1";
      progressbar_elapsed_color = "4";
      user_interface = "alternative";
      header_visibility = "yes";
      statusbar_visibility = "yes";
      titles_visibility = "no";
      jump_to_now_playing_song_at_start = "yes";
      enable_window_title = "yes";
      search_engine_default_search_mode = "2";
      external_editor = "hx";
      use_console_editor = "yes";
      current_item_prefix = "$(blue)$r";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(green)$r";
      current_item_inactive_column_suffix = "$/r$(end)";
      now_playing_prefix = "$b $(blue)";
      now_playing_suffix = "  $/b$(end)";
      media_library_primary_tag = "album_artist";
      media_library_albums_split_by_date = "no";
      cyclic_scrolling = "no";
    };
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }
      { key = "g"; command = "move_home"; }
      { key = "G"; command = "move_end"; }
      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
      { key = "J"; command = ["select_item" "scroll_down"]; }
      { key = "K"; command = ["select_item" "scroll_up"]; }
      { key = "ctrl-b"; command = "page_up"; }
      { key = "ctrl-u"; command = "page_up"; }
      { key = "ctrl-f"; command = "page_down"; }
      { key = "ctrl-d"; command = "page_down"; }
    ];
  };

  # NNN file browser
  programs.nnn = {
    enable = true;
  };

  # miniplayer configuration
  xdg.configFile."miniplayer/config".source = ../dots/miniplayer/config;

  # mpd-notification configuration (for album art)
  xdg.configFile."mpd-notification.conf".source = ../dots/mpd-notification.conf;

  # Neovim  
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  # Helix
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.helix;
    # General Helix settings
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          center = [ "file-type" ];
        };
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
    # Configure Language support
    languages = {
      # Add nixd LSP
      language-server.nixd = {
        command = "nixd";
      };
      # Configure languages
      language = [
        #  nix to use nixd LSP and nixpkgs-fmt when :format
        { name = "nix";
          language-servers = [ "nixd" ];
          formatter = {
            command = "nixpkgs-fmt";
          };}
        # Markdowm marksman is already configured by default
      ];
    };
  };

  # Bat (cat clone)
  programs.bat = {
    enable = true;
   config.theme = "base16";
    config.pager = "less -FR";
    extraPackages = with pkgs.bat-extras; [ batdiff batman batpipe ];
    themes = {
      Dracula = builtins.readFile (pkgs.fetchFromGitHub
        {
          owner = "dracula";
          repo = "sublime"; # Bat uses sublime syntax for its themes 
          rev = "c5de15a0ad654a2c7d8f086ae67c2c77fda07c5f";
          sha256 = "sha256-m/MHz4phd3WR56I5jfi4hMXnFf4L4iXVpMFwtd0L0XE=";
        } + "/Dracula.tmTheme");
      Catppuccin-Mocha = builtins.readFile (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        } + "/Catppuccin-mocha.tmTheme");
    };
  };

  # fzf
  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
    defaultOptions = [
      "--ansi"
      "--preview-window 'right:60%'"
      "--preview 'bat --color=always --style=header,grid --line-range :200 {}'"
    ];
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

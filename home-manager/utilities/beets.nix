{ pkgs, config, ... }: {

  ###########################
  ## Extra packages needed ##
  ###########################
  home.packages = with pkgs; [
    python311Packages.requests # fetchart plugin
    # python311Packages.pylast # lastgenre plugin
    python311Packages.mpd2 # mpdstats plugin
  ];

  ###############
  ## mpd stats ## 
  ###############
  # make a systemd user service that starts `beets mpdstats` 
  systemd.user.services."beets-mpdstats" = {
    Unit = {
      Description = "Beets MPDStats daemon";
      After = [ "mpd.service"] ;
      Requires = "mpd.service";
      };
    Service.ExecStart = "${config.programs.beets.package}/bin/beet mpdstats";
    Install.WantedBy = [ "default.target" ];
  };

  ##########################
  ## Beets configurataion ##
  ##########################

  programs.beets = {
    enable = true;
    package = pkgs.beets-unstable;

    settings = {

      ###########
      # General #
      ###########
      directory = "/home/jankasi/Music";
      library = "/home/jankasi/Music/musiclibrary.db";

      # Prevent non ascii characters in paths, but preserve the default tags
      # Setting languages = "en" is more accurate for the names but changes the tags,
      # which isn't good.
      asciify_paths = true;

      import = {
        move = true; # you can use `beet import -m|-c /music/to/import` to move/copy too
        write = true; # write database changes into the files too, e.g. lyrics, some tags
        bell = true; # ring terminal bell when importer needs your input
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

      #################
      # naming scheme #
      #################

      paths = {

        # if multiple matches, goes in order in config file.
        # Nix generates the following queries in alphabetical order

        default = "%ifdef{custombucket,$\{custombucket}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/Albums/$album%aunique{}/$track $title,01_Albums/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/$album%aunique{}/$track $title}";

        ## Explanation of default sort:
        # if `custombucket` field is defined,
          # return `$custombucket` field content into top level folder, and sort into
          # albumartist/alt_albumartist, then album folder.
        # otherwise, if $alt_albumartist field is defined,
          # use this instead of $albumartist,
        # then standard default structure:
        ###### NOTE: custombucket is returned exactly, so define as "03_RARE" for the folder name, for example. 

        singleton = "%ifdef{custombucket,$\{custombucket}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/Singles/$title%sunique{},02_Non-Album/$albumartist/$title%sunique{}}";

        # if custombucket is defined, sort into custom bucket, then albumartist/alt_albumartist, then singles, then track.

        comp = "04_Compilations/$album%aunique{}/$track $title";
      };

      ###########
      # Plugins #
      ###########

      plugins = "lyrics duplicates missing edit info badfiles fetchart embedart fuzzy random playlist smartplaylist mbsync mpdstats mpdupdate fish";

      lyrics = {
        fallback = "";
        auto = true;
        sources = "lrclib";
        synced = true;
      };

      fetchart = {
        cover_format = "jpeg";
        enforce_ratio = true;
        souces = "filesystem coverart itunes amazon albumart";
      };

      embedart = {
        maxwidth = 500;
      };
    };
  };
}

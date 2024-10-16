{ pkgs, config, ... }: {

  ###########################
  ## Extra packages needed ##
  ###########################
  home.packages = with pkgs; [
    python311Packages.requests # fetchart plugin
    # python311Packages.pylast # lastgenre plugin
    python311Packages.mpd2 # mpdstats plugin
    lame
    ffmpeg
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
      directory = "/home/jankasi/Music/01 Transparent Lossy";
      library = "/home/jankasi/Music/musiclibrary.db";

      # Prevent non ascii characters in paths
      asciify_paths = true;
      id3v23 = true;

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

        default = "%ifdef{custombucket,$\{custombucket}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/Albums/$album%aunique{}/$track $title,Albums/%bucket{%asciify{%ifdef{alt_albumartist,$alt_albumartist,$albumartist}}}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/$album%aunique{}/$track $title}";

        ## Explanation of default sort:
        # if `custombucket` field is defined,
          # return `$custombucket` field content into top level folder, and sort into
          # albumartist/alt_albumartist, then album folder.
        # otherwise, if $alt_albumartist field is defined,
          # use this instead of $albumartist,
        # then standard default structure, sorted into buckets by artist name:
        ###### NOTE: custombucket is returned exactly, so define as "RARE" for the folder name, for example. 

        singleton = "%ifdef{custombucket,$\{custombucket}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/Singles/$title%sunique{},Non-Album/%bucket{%asciify{%ifdef{alt_albumartist, $alt_albumartist,$albumartist}}}/%ifdef{alt_albumartist,$alt_albumartist,$albumartist}/$title%sunique{}}";

        # if custombucket is defined, sort into custom bucket, then into alphabet bucket sorted albumartist/alt_albumartist, then singles, then track.

        comp = "Compilations/$album%aunique{}/$track $title";
      };

      ###########
      # Plugins #
      ###########

      plugins = "duplicates missing edit info badfiles fetchart embedart fuzzy random playlist smartplaylist mbsync mpdstats mpdupdate convert bucket lyrics fromfilename fish";

      playlist = {
        auto = true; # update playlists when beets moves/removes files
        relative_to = "~/Music/01 Transparent Lossy";
        playlist_dir = "~/Music/00 Playlists/beets";
      };

      # Remember to add lyrics to plugins if using this
      lyrics = {
        fallback = "";
        auto = false;
        sources = "lrclib";
      };

      fetchart = {
        cover_format = "jpeg";
        enforce_ratio = true;
        souces = "filesystem coverart itunes amazon albumart";
      };

      embedart = {
        maxwidth = 500;
      };

      convert = {
        auto = true;
        copy_album_art = true;
        dest = "~/Music/convertplugin";        

        never_convert_lossy_files = true;
        # lossy files aren't transcoded
        # files that don't need to be transcoded will be copied to destination

        id3v23 = true; # Better compatibility, use id3 v 2.3 instead of 2.4

        command = "/home/jankasi/.config/beets/gaplessmp3.sh \"$source\" \"$dest\"";

        # command = "ffmpeg -i \"$source\" -f wav - | lame -V 2 --noreplaygain - \"$dest\"";

        extension = "mp3";

      };

      bucket = {
        bucket_alpha = ["0-9" "A-F" "G-M" "N-S" "T-Z"];
      };
    };
  };
}

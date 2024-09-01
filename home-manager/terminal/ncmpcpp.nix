{ pkgs, ... }: {
  programs.ncmpcpp = {
    package = pkgs.ncmpcpp.override { visualizerSupport = true; }; # this makes it build from source
    enable = false;
    # mpdMusicDir = "/home/jankasi/Music"; # On Linux platforms the services.mpd.musicDirectory is used as the default if services.mpd.enable is true

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
      external_editor = "emacsclient -nw";
      use_console_editor = "yes";
      current_item_prefix = "$(blue)$r";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(green)$r";
      current_item_inactive_column_suffix = "$/r$(end)";
      now_playing_prefix = "$b$(blue)";
      now_playing_suffix = "$/b$(end)";
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
      { key = "J"; command = [ "select_item" "scroll_down" ]; }
      { key = "K"; command = [ "select_item" "scroll_up" ]; }
      { key = "ctrl-k"; command = "page_up"; }
      { key = "ctrl-j"; command = "page_down"; }
      { key = "ctrl-l"; command = "show_lyrics"; }
    ];
  };
}

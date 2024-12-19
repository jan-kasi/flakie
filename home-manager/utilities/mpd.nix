{
  services.mpd = {
    enable = false;
    musicDirectory = "/home/jankasi/Music/01 Transparent Lossy/";
    playlistDirectory = "/home/jankasi/Music/00 Playlists/mpd/";
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

  services.mpdris2.enable = false;

  # xdg.configFile."mpd-notification.conf".text = ''
  #   music-dir = /home/jankasi/Music/
  # '';
}

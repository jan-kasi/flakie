{
  services.minidlna = {
    enable = true;
    openFirewall = true;
    settings = {
      log_level = "error";
      inotify = "yes";
      friendlt_name = "minidlna media";
      media_dir = [
        "V,/mnt/minidlna/Videos/" # Video files are located here
      ];
    };
  };
}

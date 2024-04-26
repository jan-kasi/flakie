{
  services.autorandr.enable = true;
  programs.autorandr = {
    enable = true;
    profiles = {
      "mobile" = {
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "3800x2160";
            roate = "normal";
          };
          DP1.enable = false;
          DP2.enable = false;
        };
      };
      "up" = {
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            position = "0x2160";
            mode = "3800x2160";
            roate = "normal";
          };
          DP1.enable = false;
          DP2 = {
            enable = true;
            primary = false;
            position = "0x0";
            mode = "1920x1080";
            roate = "normal";
            scale = 2;
          };
        };
      };
      "monitor" = {
        config = {
          eDP-1.enable = false;
          DP1.enable = false;
          DP2 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            roate = "normal";
            scale = 2;
          };
        };
      };
    };
  };
}

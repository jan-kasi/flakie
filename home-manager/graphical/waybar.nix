{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "custom/nix" "hyprland/workspaces" "tray" ];
        modules-center = [ "clock" ];
        modules-right = [ "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

        "custom/nix" = {
          format = " 󱄅 ";
          tooltip = false;
          on-click = "sh $HOME/.config/rofi/bin/launcher";
          on-click-right = "sh $HOME/.config/rofi/bin/powermenu";
        };

        "hyprland/workspaces" = {
          tooltip = false;
          active-only = false;
          on-click = "activate";
          show-special = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format-icons = {
            active = "";
            default = "";
          };
        };

        tray = {
          icon-size = 14;
          spacing = 5;
        };

        clock = {
          format = "<span color='#b4befe'> </span>{:%H:%M}";
          interval = 60;
          tooltip-format = "{:%Y-%m-%d}";
        };

        backlight = {
          device = "intel_backlight";
          format = "<span color='#b4befe'>{icon}</span> {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        pulseaudio = {
          format = "<span color='#b4befe'>{icon}</span> {volume}%";
          format-muted = "<span color='#b4befe'>󰖁</span>";
          tooltip = false;
          format-icons = {
            headphone = "";
            default = [ "" "󰕾" "󰕾" "󰕾" "" "" "" ];
          };
          scroll-step = 1;
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
        };

        bluetooth = {
          format = "<span color='#b4befe'></span> {status}";
          format-diabled = ""; # an empty format will hide the module 
          format-connected = "<span color='#b4befe'>󰂱</span> {num_connections}";
          tooltip-format-enumerate-connected = "{device_enumerate}";
          on-click = "sh $HOME/.config/rofi/bin/rofi-bluetooth";
        };

        network = {
          interface = "wlp0s20f3";
          format = "{ifname}";
          format-wifi = "<span color='#b4befe'> </span>{essid}";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
          tooltip = false;
          on-click = "sh $HOME/.config/rofi/bin/rofi-wifi-menu";
        };

        battery = {
          format = "<span color='#b4befe'>{icon}</span> {capacity}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          format-charging = "<span color='#b4befe'></span> {capacity}%";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: 'MesloLGS NF';
        font-size: 14px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 20px;
      }

      window#waybar {
        background: transparent;
      }

      #custom-nix, #workspaces, #tray {
        border-radius: 10px;
        background-color: #11111b;
        color: #b4befe;
        margin-top: 5px;
      	margin-right: 5px;
        padding-top: 1px;
        padding-left: 15px;
        padding-right: 15px;
      }

      #custom-nix {
        font-size: 20px;
      	margin-left: 15px;
        color: #b4befe;
      }

      #workspaces button.active {
        background: #11111b;
        color: #b4befe;
      }

      #tray {
        background: #11111b;
        color: #b4befe;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery{
        border-radius: 10px;
        background-color: #11111b;
        color: #cdd6f4;
        margin-top: 5px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 5px;
      }

      #backlight, #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }

      #pulseaudio, #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }

      #clock {
        margin-right: 5px;
      }
    '';
  };
}

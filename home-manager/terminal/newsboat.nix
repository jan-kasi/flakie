{
  programs.newsboat = {
    enable = true;
    extraConfig = ''
      color listnormal         color15 default
      color listnormal_unread  color2  default
      color listfocus_unread   color2  color0
      color listfocus          default color0
      color background         default default
      color article            default default
      color end-of-text-marker color8  default
      color info               color4  color8
      color hint-separator     default color8
      color hint-description   default color8
      color title              color14 color8

      highlight article "^(Feed|Title|Author|Link|Date): .+" color4 default bold
      highlight article "^(Feed|Title|Author|Link|Date):" color14 default bold

      highlight article "\\((link|image|video)\\)" color8 default
      highlight article "https?://[^ ]+" color4 default
      highlight article "\[[0-9]+\]" color6 default bold
    '';
    urls = [
      # comics
      {
        title = "Questionable Content";
        url = "https://www.questionablecontent.net/QCRSS.xml";
        tags = [ "comic" ];
      }
      {
        title = "xkcd";
        url = "https://xkcd.com/atom.xml";
        tags = [ "comic" ];
      }
      {
        title = "webcomic name";
        url = "https://webcomicname.com/rss";
        tags = [ "comic" ];
      }

      # newsletters
      {
        title = "Nicky Case";
        url = "https://ncase.me/feed.xml";
        tags = [ "newsletter" "blog" ];
      }
      {
        title = "Scott H Young";
        url = "https://feeds.feedburner.com/scotthyoung/HAHx";
        tags = [ "blog" "learning" ];
      }

      # video content
      {
        title = "vewn";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCd0zIZlbgvEifm_hd3FwlBQ";
        tags = [ "youtube" "animation" ];
      }
      {
        title = "Spikima Movies";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCa8VCGFAY0yjDrexYFeVoYg";
        tags = [ "youtube" "film" ];
      }
      {
        title = "serr";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCgHVCHgF3MMjffeA_EMisHw";
        tags = [ "youtube" "photography" ];
      }
      {
        title = "Philosophy Tube";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC2PA-AKmVpU6NKCGtZq_rKQ";
        tags = [ "youtube" "philosophy" "essay" ];
      }
      {
        title = "hazel";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCjNErCQgCndSOl6t33m1-nQ";
        tags = [ "youtube" "anime" "essay" ];
      }
      {
        title = "Damon Dominique";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCH5mdDlZ0haTodJmSxhst2w";
        tags = [ "youtube" "blog" ];
      }

      {
        title = "amikid";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCAPwJEqyypq9q895BD6DsqQ";
        tags = [ "youtube" "animation" ];
      }
      {
        title = "3Blue1Brown";
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCYO_jab_esuFRV4b17AJtAw";
        tags = [ "youtube" "maths" ];
      }
    ];
  };
}

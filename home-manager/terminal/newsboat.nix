{
  programs.newsboat = {
    enable = true;
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
      title = "amikid";
      url = "https://www.youtube.com/channel/UCAPwJEqyypq9q895BD6DsqQ";
      tags = [ "youtube" "animation" ];
    }
      {
        title = "3Blue1Brown";
        url = "https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw";
        tags = [ "youtube" "maths" ];
      }

    ];
  };
}

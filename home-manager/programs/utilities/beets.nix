{ pkgs, ... }:
{
  programs.beets = {
    enable = true;
    package = pkgs.beets-unstable;
    settings = {
      plugins = "duplicates missing edit lastgenre fetchart mpdupdate fish random info fuzzy deezer spotify";
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
}

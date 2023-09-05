{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    escapeTime = 0;
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      tmux-thumbs
      sensible
    ];
  };
}

{ pkgs, ... }: {

  imports = [
    ./fish.nix
    ./helix.nix
    ./emacs.nix

    ./ncmpcpp.nix
    ./newsboat.nix
    # ./catgirl.nix
    # ./starship
  ];

  programs = {
    nnn.enable = true;

    tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      escapeTime = 0;
      sensibleOnTop = true;
      keyMode = "vi";
      plugins = with pkgs.tmuxPlugins; [
        catppuccin
        tmux-thumbs
        sensible
      ];
    };

    zellij = {
      enable = false;
      enableFishIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };
  };
}

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
    vim.enable = true;
    bash.enable = true; # source and update .profile approriately

    tmux = {
      enable = false;
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
      enable = true;
      enableFishIntegration = false;
      enableBashIntegration = false;
    };
  };
}

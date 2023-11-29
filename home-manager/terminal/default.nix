{ pkgs, ... }: {

  imports = [
    ./fish.nix
    ./tmux.nix
    #./zellij

    ./helix.nix

    ./ncmpcpp.nix
    ./newsboat.nix
    # ./catgirl.nix
    #./starship
  ];

  programs = {
    nnn.enable = true;
    vim.enable = true;

    emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraPackages = epkgs: [ epkgs.vterm ];
    };

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

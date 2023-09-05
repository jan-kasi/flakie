{ pkgs, ... }: {
  programs.vscode = {
    enable = false;
    extensions = with pkgs.vscode-extensions; [ foam.foam-vscode ];
  };
}

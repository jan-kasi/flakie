{
  imports = [
    ./kitty.nix
    # ./foot.nix
    ./firefox.nix
    ./nautilus.nix
    # ./vscode.nix
    ./zathura.nix
  ];

  programs = {
    imv.enable = true;
    mpv.enable = true;
  };
}

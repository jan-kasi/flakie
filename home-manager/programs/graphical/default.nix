{
  imports = [
    ./kitty.nix
    ./foot.nix
    ./firefox.nix
    ./nautilus.nix
    ./vscode.nix
  ];

  programs = {
    imv.enable = true;
    mpv.enable = true;
    zathura.enable = true;
  };
}

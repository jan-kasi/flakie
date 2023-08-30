{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nurl = "nix run nixpkgs#nurl ";
      neofetch = "nix run nixpkgs#neofetch";
      "7zz" = "nix run nixpkgs#_7zz --";
      hmsw = "home-manager switch --flake .#jankasi@snow";
      nrsw = "sudo nixos-rebuild switch --flake .#snow";
      cleanboot = "sudo /run/current-system/bin/switch-to-configuration boot";
      nixhist = "sudo nix profile history --profile /nix/var/nix/profiles/system";
    };
    functions = {
      fish_greeting = ''
        cbonsai -p
      '';
      # change background color when certain actions performed (sudo)
      sudo = ''
        printf '\x1b]11;rgb:4040/2020/3030\x1b\\'
        command sudo $argv
        printf '\x1b]11;\x1b\\'
      '';
    };
    interactiveShellInit = ''
      starship init fish | source
    '';
    plugins = [
      # Enable a plugin from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "foreign-env"; src = pkgs.fishPlugins.foreign-env.src; }
      { name = "z"; src = pkgs.fishPlugins.z.src; }
    ];
  };
}
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
      replnix = "nix repl --expr 'import <nixpkgs>{}'";
    };
    functions = {
      fish_greeting = "krabby random";
      # change background color when certain actions performed (sudo)
      sudo = ''
        printf '\x1b]11;rgb:4040/2020/3030\x1b\\'
        command sudo $argv
        printf '\x1b]111\x1b\\'
      '';
      # home-manager = ''
      #   printf '\x1b]11;#8839ef\x1b\\'
      #   command home-manager $argv
      #   printf '\x1b]111\x1b\\'
      # '';
    };

    plugins = [
      # Enable a plugin from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "fzf.fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer.src; }
    ];
  };
}

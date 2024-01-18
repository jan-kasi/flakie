# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../dev/nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
  feather-icon-font = pkgs.callPackage ./feather-icon-font { };
  chatdocs = pkgs.callPackage ./chatdocs { };
}

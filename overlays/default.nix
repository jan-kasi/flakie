# This file defines overlays
{ inputs, ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    pureref = prev.pureref.overrideAttrs (oldAttrs: rec {
      version = "2.0.0";
      postInstall = ''
        cat > $bin/share/applications/pureref.desktop <<EOF
        [Desktop Entry]
        Type=Application
        Version=2.0.0
        Name=pureref
        Comment=Reference Image Viewer
        Exec=pureref %U
        Terminal=false
        Icon=pureref
        DesktopName=pureref
        Categories=Graphics
        StartupWMClass=pureref
        EOF
      '';
    });
  };

  newm-atha = final: prev: {
    newm-atha = inputs.newm-atha.packages."x86_64-linux".newm-atha;
  };

  # When applied, the stable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}

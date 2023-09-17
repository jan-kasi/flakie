{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # For gamepad controller?
    # initrd.kernelModules = [  ];

    # Should probably manually disable this
    swraid.enable = false; # Default: "`true` if stateVersion is older than 23.11"
  };
}

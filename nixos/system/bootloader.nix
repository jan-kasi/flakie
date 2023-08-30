{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # For gamepad controller?
    # initrd.kernelModules = [  ];
  };
}

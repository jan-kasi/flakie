{
  hardware.enableAllFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  powerManagement.enable = true;

  hardware.bluetooth.enable = true;

  hardware.uinput.enable = true;
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };
}

{ pkgs, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # For gamepad controller?
    # initrd.kernelModules = [  ];

    # use the latest kernel
    kernelPackages = pkgs.linuxPackages_latest;


    # potential reason and solution for freezes/crashes
    # https://discourse.nixos.org/t/why-does-my-root-mount-suddenly-remount-as-read-only-after-a-while/33595/11
    kernelParams = [
      "nvme_core.default_ps_max_latency_us=0"
      "pcie_aspm=off"
    ];

    # Should probably manually disable this
    # swraid.enable = false; # Default: "`true` if stateVersion is older than 23.11"
  };
}

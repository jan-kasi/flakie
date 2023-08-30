{
  networking = {
    hostName = "snow";
    networkmanager.enable = true;

    # Disable the firewall altogether.
    firewall.enable = false;

    # Or open ports in the firewall.
    # firewall.allowedTCPPorts = [ 
    #   8200 # minidlna option opens this
    #   8080 # qrcp
    # ];
    # firewall.allowedUDPPorts = [
    #  1900 # minidlna option opens this  
    #  { from = 60000; to = 61000; } # mosh opens this
    #  22 # openssh opens this
    # ];
  };
}

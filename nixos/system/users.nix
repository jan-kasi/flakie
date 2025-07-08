{ pkgs, ... }: {
  users.users = {
    jankasi = {
      description = "jan kasi";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "libvirtd" "kvm" ];
      openssh.authorizedKeys.keys = [
        # Add public key(s) here if you plan on using SSH to connect
      ];
    };

    minidlna = {
      extraGroups = [ "users" ]; # Allow access to directories (can't do /home)
    };
  };

  environment.shells = with pkgs; [
    dash
    fish
  ]; # see shells in nixos wiki
}

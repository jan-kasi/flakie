{ pkgs, ... }: {
  users.users = {
    jankasi = {
      description = "jan kasi";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        # Add public key(s) here if you plan on using SSH to connect
      ];
    };
    minidlna = {
      extraGroups = [ "users" ]; # Allow access to directories (can't do /home)
    };
  };
  environment.shells = with pkgs; [ fish ]; # see shells in nixos wiki
}

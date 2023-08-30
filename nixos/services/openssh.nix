{
  # Remote access with SSH
  services.openssh = {
    enable = true;  
    settings = {
      # false = use keys only. true = allow SSH using password (not recommended)
      PasswordAuthentication = true;
      # Forbid root login through SSH.
      PermitRootLogin = "no";
    };
  };
}

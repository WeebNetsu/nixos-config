{
  ...
}:

{
  services.openssh = {
    # remember to open tcp port 22 if enabling
    enable = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true; # Set to false later if you move to SSH keys
    };
  };
}

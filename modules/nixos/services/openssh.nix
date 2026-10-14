{
  ...
}:

{
  services.openssh = {
    enable = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true; # Set to false later if you move to SSH keys
    };
  };
}

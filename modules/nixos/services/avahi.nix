{
  ...
}:

{
  # required by warpinator
  services.avahi = {
    enable = true;
    nssmdns4 = true; # Allows software to find .local addresses
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };
}

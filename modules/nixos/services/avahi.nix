{
  ...
}:

{
  # required by warpinator
  services.avahi = {
    enable = true;
    nssmdns4 = true; # Allows software to find .local addresses
    # settings = {
    #   publish = {
    #     "disable-publishing" = false;
    #     disable-user-service-publishing = false;
    #     publish-addresses = true;
    #   };
    # };
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };
}

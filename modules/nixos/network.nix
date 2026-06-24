{
  ...
}:

{
  networking = {
    hostName = "nixos"; # Define your hostname.

    # hosts = {
    #   # this is for local wildduck server, feel free to remove later
    #   "127.0.0.1" = [
    #     "teacher.com"
    #     "mail.teacher.com"
    #   ];
    # };

    # Enable networking
    networkmanager.enable = true;

    # Open ports in the firewall.
    firewall = {
      enable = true;
      # Warpinator uses 42000 for transfers and 42001 for authentication
      allowedTCPPorts = [
        42000 # warpinator
        42001 # warpinator
        # 8080
        # 4000
        # 3000
      ];
      allowedUDPPorts = [
        42000 # warpinator
        42001 # warpinator
        # 8080
        # 4000
        # 3000
      ];
    };
  };
}

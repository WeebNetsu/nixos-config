{
  ...
}:

{
  networking = {
    hostName = "nixos"; # Define your hostname.

    # Enable networking
    networkmanager.enable = true;

    # Open ports in the firewall.
    firewall = {
      enable = true;
      # Warpinator uses 42000 for transfers and 42001 for authentication
      allowedTCPPorts = [
        42000 # warpinator
        42001 # warpinator
      ];
      allowedUDPPorts = [
        42000 # warpinator
        42001 # warpinator
      ];
    };
  };
}

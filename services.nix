{
  config,
  pkgs,
  inputs,
  nixpkgs,
  # hyprland,
  # hypr-plugins,
  # home-manager,
  ...
}:

{
  services = {
    # Add open source nvidia drivers
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      # Enable the XFCE Desktop Environment.
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "za";
        variant = "";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # other services
    playerctld.enable = true; # play pause from anywhere support

    # vpn
    mullvad-vpn.enable = true;

    gnome.gnome-keyring.enable = true;
    #   security.pam.services.lightdm.enableGnomeKeyring = true;

    flatpak.enable = true;

    # required by warpinator
    avahi = {
      enable = true;
      nssmdns4 = true; # Allows software to find .local addresses
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };

    # chatgpt interface for our AI
    open-webui = {
      enable = true;
      port = 5555;
      openFirewall = true;
      host = "0.0.0.0";
    };

    # search engine for our AI models
    searx = {
      enable = true;
      environmentFile = "/home/netsu/searxng.env";
      package = pkgs.searxng;
      settings = {
        server.port = 8888;
        server.bind_address = "0.0.0.0";

        search = {
          # json allows lm studio to make searches
          formats = [
            "html"
            "json"
          ];
        };
      };
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # enable mounting and unmounting external drives
  # services.udisks2.enable = true;
  # allows file manager to talk to udisk2?
  # services.gvfs.enable = true;
  #   auto mount drives?
  # services.devmon.enable = true;

  # This makes the NTFS helper available to udisks2 and the kernel
  #   system.fsPackages = [ pkgs.ntfs3g ];

}

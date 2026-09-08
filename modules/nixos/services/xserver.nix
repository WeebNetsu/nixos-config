{
  lib,
  config,
  ...
}:

{
  services.xserver = {
    # Add open source nvidia drivers
    enable = true;
    # include nvidia drivers, but only if the host is desktop
    videoDrivers = lib.optionals (config.networking.hostName == "desktop") [
      "nvidia"
    ];

    # Enable the XFCE Desktop Environment.
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "za";
      variant = "";
    };
  };
}

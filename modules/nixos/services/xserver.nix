{
  ...
}:

{
  services.xserver = {
    # Add open source nvidia drivers
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
}

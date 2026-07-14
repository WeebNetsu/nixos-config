{
  ...
}:

{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # other services
    playerctld.enable = true; # play pause from anywhere support

    # vpn
    mullvad-vpn.enable = true;

    # enable keyring
    dbus.enable = true;
    gnome.gnome-keyring.enable = true;

    flatpak.enable = true;
  };
}

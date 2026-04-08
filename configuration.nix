{
  config,
  pkgs,
  nixpkgs,
  ...
}:

let
  unstable = nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  # disable systemd boot to make grub work
  # boot.loader.systemd-boot.enable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalization properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Add open source nvidia drivers
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.netsu = {
    isNormalUser = true;
    description = "Netsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;

  # enable virtualization with virt manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # vpn
  services.mullvad-vpn.enable = true;

  # obs with droidcam
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    vscode
    brave
    fastfetch
    # sublime4 # sublime text
    mongodb-compass
    nodejs_20
    curl
    slack
    telegram-desktop
    os-prober
    htop
    # nvtopPackages.v3d # does not detect gpu?
    nvtopPackages.nvidia
    flameshot
    git
    discord
    nixfmt # format nix code
    trash-cli
    tldr
    speedtest-cli
    mpv
    handbrake
    sqlitebrowser
    libreoffice
    audacity
    megasync
    hoppscotch
    vivaldi
    brasero
    warpinator
    scrcpy

    # meteor # too old, like version 2 instead of 3

    # unstable packages
    unstable.fresh-editor
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.flatpak.enable = true;
  # below is required to use flatpak
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.flatpak.packages = [
    "com.actualbudget.actual"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}

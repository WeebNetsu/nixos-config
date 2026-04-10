{
  config,
  pkgs,
  nixpkgs,
  hyprland,
  hypr-plugins,
  ...
}:

let
  unstable = nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # inputs.hyprland.nixosModules.default
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

  environment.variables = {
    GTK_THEME = "Adwaita-dark";
    # QT_QPA_PLATFORMTHEME = "qt5ct"; # Or qt6ct
  };

  # auto mount my 2 other drives
  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/2C6D80782C1495DF";
    fsType = "ntfs";
    options = [
      "defaults"
      "nofail" # 'nofail' prevents boot loops if the drive is missing
    ];
  };

  fileSystems."/mnt/linux-mint" = {
    device = "/dev/disk/by-uuid/185ea12c-8c2a-45a3-9d07-01ecd7b93657";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  # give me permission on the drives
  #   system.activationScripts.fix-drive-permissions = {
  #     text = ''
  #       chown -R netsu:users /mnt/shared
  #       chown -R netsu:users /mnt/linux-mint
  #     '';
  #     deps = [ ];
  #   };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalization properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Add open source nvidia drivers
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  #   hardware.nvidia.open = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # Since you're using the open-source modules
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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

  # Hyprland WM

  programs.hyprland = {
    enable = true;
    # Use the package from the flake
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    # Use the plugin from the same flake source
    plugins = [
      hypr-plugins.packages.${pkgs.system}.hyprscrolling
    ];
  };

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";

    # all below required for hyprland
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # fix theming issues
  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita";
        icon-theme = "Flat-Remix-Red-Dark";
        font-name = "Noto Sans Medium 11";
        document-font-name = "Noto Sans Medium 11";
        monospace-font-name = "Noto Sans Mono Medium 11";
      };
    }
  ];

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
    mongodb-compass
    nodejs_20
    curl
    slack
    telegram-desktop
    os-prober
    htop
    nvtopPackages.nvidia
    # flameshot
    gscreenshot
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
    xdg-desktop-portal-hyprland # required by hyprland
    ncdu
    lmstudio
    cmake
    hyprlauncher
    hyprpaper # wallpapers on hyprland
    waybar
    nemo
    # kdePackages.dolphin
    lite-xl # sublime text alt
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

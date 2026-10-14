{
  config,
  pkgs,
  nixpkgs,
  hyprland,
  hypr-plugins,
  home-manager,
  inputs,
  self,
  ...
}:

let
  unstable = nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    home-manager.nixosModules.home-manager
    "${self}/modules/core"
    "${self}/modules/nixos"
  ];

  powerManagement.cpuFreqGovernor = "performance";

  environment.variables = {
    GTK_THEME = "Adwaita-dark";
    DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
  };

  # Extra SSD 1 (sda1)
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/b60b7d07-55fa-45ca-8503-f404000a3612";
    fsType = "ext4"; # change to btrfs/ntfs if applicable
    options = [
      "defaults"
      "nofail"
      "x-systemd.automount"
    ];
  };

  # # Extra SSD 2 (sdb3)
  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/bcccae24-b0e0-4ec6-81e7-7db95b41a4a0";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
      "x-systemd.automount"
    ];
  };

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";
  security.polkit.enable = true;
  # Select internationalization properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.netsu = {
    isNormalUser = true;
    description = "Netsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "docker"
      "libvirtd"
      "adbusers"
      #   "cdrom"
      #   "storage"
    ];
  };

  # in theory this should be the first responder if swap is needed
  # with swapDevices being used as a fallback
  zramSwap = {
    enable = true;
    memoryMax = 8 * 1024 * 1024 * 1024; # 8GB in bytes
    algorithm = "zstd";
    priority = 50;
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # Size in MB (e.g., 8GB)
      priority = 10; # Lower priority than zram so it's used second
    }
  ];

  systemd = {
    # should help out of memory issues
    oomd.enable = true;

    # VR :)
    # user.services.monado.environment = {
    #   STEAMVR_LH_ENABLE = "1";
    #   XRT_COMPOSITOR_COMPUTE = "1";
    # };
  };

  # required by pipewire?
  security.rtkit.enable = true;

  # unlock the darn keyring!
  security.pam.services.lightdm.enableGnomeKeyring = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ADB_LIBUSB = "0";

    # all below required for hyprland
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";

    # Tells Electron apps to look for the GNOME keyring
    PASSWORD_STORE_SET = "gnome-keyring";
    # Some apps specifically look for this to enable secret service support (element chat)
    # XDG_CURRENT_DESKTOP = "GNOME";
  };

  # below is required to use flatpak
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };

    # VR :)
    # todo: lib path is /home/netsu, we should use conf.home.homeDirectory if possible
    # configFile."openxr/1/active_runtime.json".text = ''
    #   {
    #      "file_format_version": "1.0.0",
    #       "runtime": {
    #       "VALVE_runtime_is_steamvr": true,
    #       "library_path": "/home/netsu/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so",
    #       "name": "SteamVR"
    #       }
    #   }
    # '';
  };

  home-manager = {
    extraSpecialArgs = { inherit unstable inputs; };
    users = {
      "netsu" = import ../../home.nix;
    };
  };

  # render with GPU not CPU
  hardware = {
    graphics.enable = true;
    # if I wanna start gaming, add below line
    graphics.enable32Bit = true;

    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  # ─────────────────────────────────────────────────────────────────────────
  # Bootloader & Kernel Setup
  # ─────────────────────────────────────────────────────────────────────────
  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      # "splash"
      "boot.shell_on_fail"
      # "udev.log_priority=3"
    ];

    # disable systemd boot to make grub work
    # boot.loader.systemd-boot.enable = true;
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };

    # fix my f-keys
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';

    # to help mount external drives
    #   boot.supportedFilesystems = [
    #     "ntfs"
    #     "exfat"
    #   ];

  };
}

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

    # uncomment for droidcam support
    # extraModulePackages = with config.boot.kernelPackages; [
    #   v4l2loopback
    # ];

    # fix my f-keys and virtual camera
    # add below to extraModprobeConfig for droidcam support
    # v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
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

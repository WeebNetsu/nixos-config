{
  config,
  pkgs,
  nixpkgs,
  hyprland,
  hypr-plugins,
  home-manager,
  inputs,
  ...
}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    fastfetch
    curl
    wget
    os-prober
    htop
    nvtopPackages.nvidia
    nixfmt # format nix code
    trash-cli
    tldr
    speedtest-cli
    mpv
    xdg-desktop-portal-hyprland # required by hyprland
    ncdu
    cmake
    hyprpaper # wallpapers on hyprland
    waybar
    rofi
    unzip
    lsof

    # seahorse # GUI to manage your passwords and see if it's unlocked
    # polkit_gnome # Required for many apps to ask for permission

    # ntfs3g # For NTFS support
    # exfat # For exFAT support
  ];

  programs = {
    # fixes some meteorjs issues when installed with curl
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        #   stdenv.cc.cc.lib
        #   zlib
        #   curl
        #   openssl
      ];
    };

    # Install firefox.
    firefox.enable = true;

    virt-manager.enable = true;

    # Hyprland WM
    hyprland = {
      enable = true;
      # Use the package from the flake
      package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      # Use the plugin from the same flake source
      plugins = [
        hypr-plugins.packages.${pkgs.system}.hyprscrolling
      ];
    };

    # fix theming issues
    dconf.profiles.user.databases = [
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
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        droidcam-obs
      ];
    };
  };
}

{
  pkgs,
  unstable,
  nixpkgs,
  inputs,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # required by sublime text https://github.com/sublimehq/sublime_text/issues/5984
      "openssl-1.1.1w"
      #   "ventoy-gtk3-1.1.10"
    ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    mongodb-compass
    slack
    telegram-desktop
    discord
    handbrake
    sqlitebrowser
    audacity
    # nextcloud-client # use nextcloudcmd instead of the client as it is wonky on hyprland
    # megasync # just couldn't get megasync or megacli to work on Hyprland
    # hoppscotch # doesn't work on wayland
    vivaldi
    # brasero
    warpinator
    scrcpy
    lmstudio
    nemo
    rclone # actually good nextcloud/megasync alternative
    # krusader
    bat
    # lite-xl # sublime text alt
    sublime4
    # meteor # too old, like version 2 instead of 3
    qbittorrent
    element-desktop
    libreoffice
    gnome-calculator
    calc
    liquidsoap
    openai-whisper
    # polybar
    # cava
    imv # sxiv alternative
    # flameshot
    satty # flameshot alternative
    slurp # "select a region in wayland and print it to stdout" used by grim/satty
    grim # required by flameshot and satty on wayland systems
    hyprpicker # color picker
    wl-clipboard # required by hyprpicker
    # piper-tts
    # wyoming-piper
    # ventoy-full-gtk
    # patool # archive manager, unzip, zip etc. less cumbersome that tar
    kdePackages.kdenlive
    # gimp
    gimp-with-plugins
    yt-dlp
    # kdePackages.k3b # cd burning, alternative to brasero
    # dvdplusrwtools # https://nixos.wiki/wiki/Writing_DVDs
    kdePackages.ark

    #development
    opencode
    nodejs_24
    # bun
    # distrobox
    flutter
    # dart
    # rust-analyzer
    # rustc
    # cargo
    gcc
    python315
    nimble
    nim
    typescript
    # lua
    # love
    # pipx
    # pdm

    # games
    unciv

    # inputs.comfyui-nix.packages.${pkgs.system}.comfyui-cuda
    # unstable packages
    unstable.fresh-editor
  ];
}

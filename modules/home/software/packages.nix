{
  pkgs,
  unstable,
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

  # gtk = {
  #   enable = true;
  #   gtk4.theme = null;
  #   font = {
  #     name = "Lexend";
  #     size = 11;
  #   };
  # };

  # programs with no additional configuration do not need their
  # own dedicated files, instead we can just list them here
  programs = {
    obsidian.enable = true;
    # cava.enable = true;
    # cavalier.enable = true;
    # onlyoffice.enable = true;
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
    warpinator
    scrcpy
    lmstudio
    nemo
    rclone # actually good nextcloud/megasync alternative
    bat
    sublime4
    qbittorrent
    element-desktop
    libreoffice
    gnome-calculator
    calc
    liquidsoap
    openai-whisper
    imv # sxiv alternative
    # flameshot
    satty # flameshot alternative
    slurp # "select a region in wayland and print it to stdout" used by grim/satty
    grim # required by flameshot and satty on wayland systems
    hyprpicker # color picker
    wl-clipboard # required by hyprpicker
    yt-dlp
    kdePackages.ark
    newsflash # rss reader

    #development
    whois
    dig
    opencode
    nodejs_24
    codebook
    gcc
    python315
    nimble
    nim
    typescript
    exercism # https://exercism.org/\
    codecrafters-cli # https://app.codecrafters.io/
    gleam
    # needed by gleam?
    inotify-tools
    beam29Packages.elixir
    beam29Packages.erlang
    beam29Packages.rebar3

    # games
    unciv
    supertuxkart

    # inputs.comfyui-nix.packages.${pkgs.system}.comfyui-cuda
    # unstable packages
    unstable.fresh-editor

    # YOUTUBE
    vivaldi
    vivaldi-ffmpeg-codecs
    grayjay
    auto-editor
    kdePackages.kdenlive
    gimp-with-plugins
  ];
}

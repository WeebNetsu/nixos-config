{
  pkgs,
  unstable,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;

    # problems.handlers = {
    #   # because sublime text 4 relies on unsupported ssl
    #   sublimetext4.broken = "warn";
    # };

    # permittedInsecurePackages = [
    #   # required by sublime text https://github.com/sublimehq/sublime_text/issues/5984
    #   "openssl-1.1.1w"
    #   #   "ventoy-gtk3-1.1.10"
    # ];
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
    # distrobox.enable = true;
    # zoom-us.enable = true;
    # element-desktop.enable = true;
    # cava.enable = true;
    # cavalier.enable = true;
    # onlyoffice.enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # cinny-desktop
    brave
    # kitty
    mongodb-compass
    pinentry-all # for gpg to work nicely
    slack
    telegram-desktop
    # signal-desktop
    discord
    handbrake
    sqlitebrowser
    audacity
    warpinator
    # scrcpy
    lmstudio
    # rustdesk
    nemo
    rclone # actually good nextcloud/megasync alternative
    # bat
    # sublime4
    qbittorrent
    zip
    libreoffice
    gnome-calculator
    gnome-calendar
    calc
    # liquidsoap
    openai-whisper
    imv # sxiv alternative
    satty # flameshot alternative
    slurp # "select a region in wayland and print it to stdout" used by grim/satty
    grim # required by flameshot and satty on wayland systems
    hyprpicker # color picker
    wl-clipboard # required by hyprpicker
    yt-dlp
    kdePackages.ark # gui zip extractor
    newsflash # rss reader
    lm_sensors # see pc temps
    # blender

    #development
    # whois
    dig
    just # pretty comfy package.json script alternative for gleam
    just-lsp
    nodejs_24
    pnpm
    awscli
    lovr
    lua
    luarocks
    # lux-cli
    # nimble
    # nim
    mongodb-atlas-cli
    mongodb-tools
    # codebook
    gcc
    # python315
    python314
    # python314Packages.uv
    # prisma_7
    typescript
    websocat # testing web sockets `websocat ws://localhost:4000/ws`
    # exercism # https://exercism.org/
    # codecrafters-cli # https://app.codecrafters.io/
    gleam
    # ---- needed by gleam ----
    inotify-tools
    beam28Packages.elixir
    beam28Packages.erlang
    # the beam29Packages compile seems to fail for rebar3
    beam28Packages.rebar3
    # ---- needed by gleam ----

    # inputs.comfyui-nix.packages.${pkgs.system}.comfyui-cuda
    # unstable packages
    unstable.fresh-editor

    # zoom-us

    # YOUTUBE
    vivaldi
    vivaldi-ffmpeg-codecs
    # grayjay
    # auto-editor
    kdePackages.kdenlive
    gimp-with-plugins
  ];
}

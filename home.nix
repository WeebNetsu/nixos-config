{
  config,
  pkgs,
  unstable,
  nixpkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "netsu";
  home.homeDirectory = "/home/netsu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName = "WeebNetsu";
    userEmail = "stephenvdw7777@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "libsecret";
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vscode
    brave
    mongodb-compass
    slack
    telegram-desktop
    discord
    handbrake
    sqlitebrowser
    audacity
    nextcloud-client # use nextcloudcmd instead of the client as it is wonky on hyprland
    # megasync # just couldn't get megasync or megacli to work on Hyprland
    hoppscotch
    vivaldi
    brasero
    warpinator
    scrcpy
    lmstudio
    nemo
    lite-xl # sublime text alt
    # meteor # too old, like version 2 instead of 3
    qbittorrent
    element-desktop
    libreoffice
    gnome-calculator
    calc
    liquidsoap
    # polybar
    # cava
    flameshot
    grim # required by flameshot on wayland systems

    #development
    opencode
    nodejs_20
    # distrobox
    flutter
    # dart
    rust-analyzer
    rustc
    cargo
    gcc
    python315
    nimble
    nim
    typescript
    lua
    love

    # games
    unciv

    # unstable packages
    unstable.fresh-editor
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprpaper.conf;
    ".local/share/nemo/actions/open_xfce_terminal.nemo_action".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.local/share/nemo/actions/open_xfce_terminal.nemo_action;
    ".config/flameshot/flameshot.ini".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/flameshot/flameshot.ini;
    ".config/waybar/config.jsonc".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/waybar/config.jsonc;
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.bashrc;

    # makes npm i -g work
    ".npmrc".text = ''
      prefix=~/.npm-global
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/netsu/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # makes npm i -g work
    PATH = "$PATH:$HOME/.npm-global/bin";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

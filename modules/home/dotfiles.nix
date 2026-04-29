{
  config,
  ...
}:

{
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/hypr/hyprpaper.conf;
    ".local/share/nemo/actions/open_xfce_terminal.nemo_action".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.local/share/nemo/actions/open_xfce_terminal.nemo_action;
    # ".config/flameshot/flameshot.ini".source =
    #   config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/flameshot/flameshot.ini;
    ".config/waybar/config.jsonc".source =
      config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/waybar/config.jsonc;
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink /home/netsu/Documents/configs/.bashrc;

    # makes npm i -g work
    ".npmrc".text = ''
      prefix=~/.npm-global
    '';
  };
}

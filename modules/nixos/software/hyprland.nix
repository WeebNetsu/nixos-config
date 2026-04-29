{
  pkgs,
  hyprland,
  hypr-plugins,
  ...
}:

{
  programs = {
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
  };
}

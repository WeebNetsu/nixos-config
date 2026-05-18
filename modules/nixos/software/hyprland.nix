{
  pkgs,
  hyprland,
  hypr-plugins,
  inputs,
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
        # hyprscrolling is now part of core? https://github.com/hyprwm/hyprland-plugins/issues/619

        # for some reasons hyprscrolling is just missing from the repos??
        # hypr-plugins.packages.${pkgs.system}.hyprscrolling

        # custom new hyprscrolling directly from source
        # inputs.hyprscroller.packages.${pkgs.system}.hyprscroller
      ];
    };
  };
}

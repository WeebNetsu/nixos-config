{
  pkgs,
  ...
}:

{
  programs = {
    # obs with droidcam
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        droidcam-obs
      ];
    };
  };
}

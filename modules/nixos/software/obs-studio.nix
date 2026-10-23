{
  pkgs,
  ...
}:

{
  programs.obs-studio = {
    enable = true;

    # uncomment below for droidcam support
    # enableVirtualCamera = true;
    # plugins = with pkgs.obs-studio-plugins; [
    #   # obs with droidcam
    #   droidcam-obs
    # ];
  };
}

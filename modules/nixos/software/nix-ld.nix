{
  pkgs,
  ...
}:

{
  programs.nix-ld = {
    # fixes some meteorjs issues when installed with curl
    enable = true;
    libraries = with pkgs; [
      # xorg.libXext
      # xorg.libX11
      # xorg.libXrender
      # xorg.libXtst
      # stdenv.cc.cc.lib
      #   zlib
      #   curl
      #   openssl
    ];
  };
}

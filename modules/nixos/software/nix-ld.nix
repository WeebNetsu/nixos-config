{
  pkgs,
  #   config,
  ...
}:

{
  programs.nix-ld = {
    # fixes some meteorjs issues when installed with curl
    enable = true;
    libraries = with pkgs; [
      # comfyui support
      #   stdenv.cc.cc
      #   zlib
      #   glib
      #   glpk
      # Add NVIDIA drivers if using CUDA:
      #   config.boot.kernelPackages.nvidia_x11

      # Defold game engine support
      # xorg.libX11
      # xorg.libXext
      # xorg.libXrender
      # xorg.libXtst
      # xorg.libXi
      # xorg.libXxf86vm
      # xorg.libXcursor
      # xorg.libXrandr
      # xorg.libXinerama
      # xorg.libXfixes
      # xorg.libXcomposite
      # xorg.libXdamage
      # xorg.libxcb
      # gtk3
      # glib
      # cairo
      # pango
      # gdk-pixbuf
      # atk
      # at-spi2-atk
      # libGL
      # libGLU
      # zlib
      # freetype
      # fontconfig
      # alsa-lib
      # openssl
      # libpulseaudio
      #   stdenv.cc.cc.lib
      # libgbm
      # libopenal
    ];
  };
}

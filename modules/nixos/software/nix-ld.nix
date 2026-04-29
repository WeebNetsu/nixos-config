{
  pkgs,
  ...
}:

{
  programs = {
    # fixes some meteorjs issues when installed with curl
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        #   stdenv.cc.cc.lib
        #   zlib
        #   curl
        #   openssl
      ];
    };
  };
}

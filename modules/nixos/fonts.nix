{
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans # pls render chinese japanese and korean!
    noto-fonts-color-emoji
    # lexend
  ];

  # fonts.fontconfig = {
  #   enable = true;
  #   defaultFonts = {
  #     sansSerif = [ "Lexend" ];
  #     serif = [ "Lexend" ];
  #     monospace = [ "Lexend" ];
  #   };
  # };
}

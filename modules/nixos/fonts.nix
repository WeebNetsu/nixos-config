{
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans # pls render chinese japanese and korean!
    noto-fonts-color-emoji
    # liberation_ttf
    # fira-code
    # fira-code-symbols
    # mplus-outline-fonts.github-hljt
    # droidsans
  ];
}

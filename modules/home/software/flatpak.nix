{
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "com.actualbudget.actual"
    "net.ankiweb.Anki"
    # "https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakref"
    # "com.google.AndroidStudio"
  ];
}

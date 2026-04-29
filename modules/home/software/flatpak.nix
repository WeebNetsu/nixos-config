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
  ];
}

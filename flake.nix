{
  description = "My NixOS Flake with Declarative Flatpak and Hyprland Plugins";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=main";
    hyprland.url = "github:hyprwm/Hyprland"; # latest hyprland ver
    hypr-plugins.url = "github:hyprwm/hyprland-plugins";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nix-flatpak,
      hyprland,
      hypr-plugins,
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          hyprland.nixosModules.default
          ./configuration.nix
        ];
        specialArgs = {
          inherit nixpkgs;
          inherit hyprland;
          inherit hypr-plugins;
        };
      };
    };
}

{
  description = "My NixOS Flake with Declarative Flatpak";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=main";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nix-flatpak,
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
        ];
        specialArgs = {
          inherit nixpkgs;
        };
      };
    };
}

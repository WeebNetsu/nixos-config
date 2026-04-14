{
  description = "My NixOS Flake with Declarative Flatpak and Hyprland Plugins";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=main";
    hyprland.url = "github:hyprwm/Hyprland"; # latest hyprland ver
    hypr-plugins.url = "github:hyprwm/hyprland-plugins";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nix-flatpak,
      hyprland,
      hypr-plugins,
      home-manager,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
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
          inherit home-manager;
        };
      };
      homeConfigurations."netsu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

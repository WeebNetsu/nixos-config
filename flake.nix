{
  description = "My NixOS Flake with Declarative Flatpak and Hyprland Plugins";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=main";
  };

  # # Need to add the base Hyprland flake to sync versions
  # hyprland.url = "github:hyprwm/Hyprland";

  # # Official plugins
  # hyprland-plugins = {
  #   url = "github:hyprwm/hyprland-plugins";
  #   inputs.hyprland.follows = "hyprland";
  # };

  # hyprglass = {
  #   url = "github:hyprnux/hyprglass";
  #   inputs.hyprland.follows = "hyprland";
  # };

  # Added 'hyprland', 'hyprland-plugins', and 'hyprglass' to the arguments here
  # And used '... @ inputs' to capture everything for specialArgs
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

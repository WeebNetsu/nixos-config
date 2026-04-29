# NixOS Config

My NixOS config for my system.

## Compile with flake

`sudo nixos-rebuild switch --flake .#nixos`

### With NH

`nh os switch .`

#### Updating

`nh os switch . --update`

#### Clean

`nh clean all --ask`

#### Install/Fix bootloader

`sudo nixos-rebuild switch --flake .#nixos --install-bootloader`

## Project Structure

```
.
├── flake.nix              # The entry point for the config
├── flake.lock
├── hosts/                 # Machine-specific configurations
│   └── desktop/           # A specific machine folder
│       ├── configuration.nix  # System-level settings (NixOS)
│       └── hardware.nix       # Result of nixos-generate-config
├── modules/               # Reusable pieces of code
│   ├── core/              # Stuff every machine needs (locale, nix-settings)
│   ├── home/              # Home Manager modules
│   │   ├── vscode.nix
│   │   ├── zsh.nix
│   │   └── default.nix    # Bundle all home modules
│   └── nixos/             # Reusable NixOS-level modules (docker, steam, etc.)
└── home.nix               # Main Home Manager entry point
```

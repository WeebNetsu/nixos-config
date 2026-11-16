# NixOS Config

My NixOS config for my system.

## Compile with flake

`sudo nixos-rebuild switch --flake .#nixos`

### With Justfile (using nh)

Installing changes per device with different hardware

- `just install-desktop`
- `just install-laptop`

#### Updating

- `just update-desktop`
- `just update-laptop`

#### Clean

`nh clean all --ask`

Or to keep your **latest AND oldest** generations:

`just PLEASE-READ-THIS-clear-space-update-justfile-code-before-running`

As the just command states, please read it before running as you will need to update the commands every time you run it

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

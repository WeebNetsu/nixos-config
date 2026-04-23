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

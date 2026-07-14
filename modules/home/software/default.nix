{ ... }:

{
  imports = [
    ./vscode.nix
    ./git.nix
    ./nh.nix
    ./flatpak.nix
    ./packages.nix
    ./flutter.nix
    ./bash.nix
    ./gpg.nix
    ./i2pd.nix
    # ./zed-editor.nix
  ];
}

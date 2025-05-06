{
  imports = [
    ./hardware.nix
    ./nix.nix
    ./locale.nix
    ./security.nix
    ./persist.nix
    ./users.nix
    ./software.nix
  ];

  system.stateVersion = "24.11";
}

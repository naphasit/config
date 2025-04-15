{
  imports = [
    ./hardware.nix
    ./locale.nix
    ./persist.nix
    ./users.nix
  ];

  system.stateVersion = "24.11";
}

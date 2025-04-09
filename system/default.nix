{
  imports = [
    ./hardware.nix
    ./locale.nix
    ./persist.nix
    ./users.nix
    ./software.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-then 7d";
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "24.11";
}

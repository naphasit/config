{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-then 7d";
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}

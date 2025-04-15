{ inputs, ... }:

{
  imports = [
    ./persist.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

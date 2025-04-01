{ inputs, home-manager, ... }:

{
  users.users."naphasitng" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPasswordFile = "/persist/passwords/naphasitng";
  };

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users."naphasitng" = ../home;
  };
}

{ home-manager, ... }:

{
  users.users."naphasitng" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPasswordFile = "/persist/passwords/naphasitng";
  };

  home-manager.users."naphasitng" = ../home;
}

{ inputs, ... }:

{
  users.users.naphasitng = {
    isNormalUser = true;
    hashedPasswordFile = "/persist/passwords/naphasitng";
    extraGroups = [ "wheel" ];
  };

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.naphasitng = import ../home;
  };
}

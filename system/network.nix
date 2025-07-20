{ lib, ... }:

{
  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "nixos";
    networkmanager.enable = true;

    wireguard.interfaces = {
      wg0 = {
        privateKeyFile = "/persist/passwords/wireguardPrivate";
        ips = [ "10.8.1.21/32" ];
        listenPort = 51820;
        mtu = 1420;

        peers = [{
          publicKey = "AHEKj0Gm9WspOC97MrH9Bbg5uhMgsk5XZtf/Ym7nYUM=";
          presharedKeyFile = "/persist/passwords/wireguardPreshared";
          endpoint = "direct.nas.nudchannel.com:7170";
          allowedIPs = [ "10.8.1.0/24" ];
          persistentKeepalive = 25;
        }];
      };
    };
  };
}

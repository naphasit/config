{ device ? throw "Set this to your disk device, e.g. /dev/sda", ... }: {
  disko.devices = {
    disk.main = {
      inherit device;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          esp = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          root = {
            name = "root";
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];

              subvolumes = {
                "/root" = { mountpoint = "/"; };

                "/persist" = {
                  mountOptions = [ "compress=zstd" "noatime" ];
                  mountpoint = "/persist";
                };

                "/nix" = {
                  mountOptions = [ "compress=zstd" "noatime" ];
                  mountpoint = "/nix";
                };

                "/swap" = {
                  mountpoint = "/swap";
                  swap = {
                    swapfile.path = "swapfile";
                    swapfile.size = "24G";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

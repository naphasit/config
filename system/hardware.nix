{ config, lib, modulesPath, ... }:

{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  fileSystems."/" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=root" "compress=zstd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=nix" "compress=zstd" "noatime" ];
  };

  fileSystems."/persist" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=persist" "compress=zstd" "noatime" ];
  };

  fileSystems."/swap" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=swap" "compress=zstd" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/nvme0n1p1";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ];

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

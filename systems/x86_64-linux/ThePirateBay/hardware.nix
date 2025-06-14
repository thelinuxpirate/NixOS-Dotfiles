{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [];
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
  };

  fileSystems = {
    "/" =
      { 
        device = "/dev/disk/by-uuid/453f3871-fa56-41b8-9af0-bae3b2f530e2";
        fsType = "ext4";
      };
    "/boot" =
      { 
       device = "/dev/disk/by-uuid/343C-78C5";
       fsType = "vfat";
       options = [ "fmask=0077" "dmask=0077" ];
      };

    "/home/trong/System/Drives/Gaming" = 
      { 
        device = "/dev/disk/by-uuid/5d75d482-9bb2-4fd2-b5c2-c8988a3e0511";
        fsType = "ext4";
      };

    "/home/trong/System/Drives/ROMs" = 
      { 
        device = "/dev/disk/by-uuid/fbca9827-3625-4795-8a84-89e029d720ba";
        fsType = "btrfs"; 
      };
  };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f8285ad9-8a9b-481e-b284-765c62d4f1a0"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

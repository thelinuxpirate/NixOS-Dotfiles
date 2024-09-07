{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # NixOS Root SSD
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9946d37c-1ce5-4666-aa13-895154a86533";
      fsType = "ext4";
    };

  # SSDTwo
  fileSystems."/drive/ssdtwo" = # change to /mnt/ssdtwo?
    { device = "/dev/disk/by-uuid/0bc7cf14-fefa-4506-9661-929cc16cd3e0";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/718d892b-51fb-40a2-842f-eed9cb4dbdb3"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

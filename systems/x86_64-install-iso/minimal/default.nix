_: {
  # Enable Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Disable wpa_supplicant (Network_Manager is enabled)
  networking.wireless.enable = false;

  suites.common.enable = true;
  system.stateVersion = "22.05";
}

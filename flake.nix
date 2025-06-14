{

  # Get rid of ThePirateBay & Rebrand to TheTreeHouse
  description = "TRONG's NixOS builds: TheTreeHouse & ThePirateShip";

  inputs = {
    # Base Inputs
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = { # Home-Manager
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = { # Snowfall Ecosystem
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # GRUB Bootloader Themes
    grub-themes.url = "github:jeslie0/nixos-grub-themes";

    # Stylix System Colors
    stylix.url = "github:danth/stylix";

    nixos-generators = { # ISO Generator
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra Inputs
    # ChadWM (Xorg DWM)
    chadwm.url = "github:thelinuxpirate/ChadWM";

    # Sleepy Suckless Ecosystem (TODO: Change to my ChadWM config)
    sleepy-dwm.url = "github:thelinuxpirate/sleepy-dwm";

    # Emacs Overlay
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixVim Configuration
    hielo.url = "github:thelinuxpirate/HIELO";

    # NvChad Nix
    nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Web Browser
    zen-browser = {
      url = "github:/0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Themes for Alacritty Terminal
    alacritty-themes.url = "github:alexghr/alacritty-theme.nix";

    # Wayland Wallpaper Tool
    swww.url = "github:LGFae/swww";

    # Ags Shell
    ags.url = "github:Aylur/ags";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Nix-Minecraft (Server)
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    # Nix-Minecraft (Launcher)
    nix-minecraft-launcher.url = "github:12Boti/nix-minecraft";

    # SSBM
    ssbm.url = "github:djanatyn/ssbm-nix/update/nixpkgs-git";

    nix-gaming = { # NixOS Gaming Options
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "thepiratebay";
          title = "ThePirateBay";
        };

        namespace = "thepiratebay";
      };
    };
  in
    lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "openssl-1.1.1w"
          "olm-3.2.16"
        ];
      };

      homes.modules = with inputs; [
        nvchad.homeManagerModule
        ags.homeManagerModules.default
        zen-browser.homeModules.beta
        spicetify-nix.homeManagerModules.default
      ];

      overlays = with inputs; [ alacritty-themes.overlays.default ];

      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
        nixos-generators.nixosModules.all-formats
        stylix.nixosModules.stylix
        chadwm.nixosModules.chadwm
        sleepy-dwm.nixosModules.sleepy
        nix-gaming.nixosModules.pipewireLowLatency
        nix-gaming.nixosModules.platformOptimizations
      ];

      templates = import ./templates {};
    };
}

{
  description = "TRONG's NixOS builds: ThePirateBay, TheTreeHouse, & ThePirateShip";

  inputs = {
    # Base Inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = { # Home-Manager
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = { # Snowfall Ecosystem
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix System Colors
    stylix.url = "github:danth/stylix";

    # GRUB Bootloader Themes
    grub-themes.url = "github:jeslie0/nixos-grub-themes";

    nixos-generators = { # ISO Generator
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra Inputs
    # Sleepy Suckless Ecosystem
    sleepy-dwm.url = "github:thelinuxpirate/sleepy-dwm";

    # Cosmic Desktop
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    # Emacs Overlay
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darkwraith Emacs
    #darkwraith-emacs.url = "github:thelinuxpirate/Darkwraith-Emacs";

    # NixVim Configuration
    hielo.url = "github:thelinuxpirate/HIELO";

    # Web Browser
    zen-browser.url = "github:/MarceColl/zen-browser-flake";

    # HyprPanel Bar
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

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
        ags.homeManagerModules.default
        spicetify-nix.homeManagerModules.default
      ];

      overlays = with inputs; [
        alacritty-themes.overlays.default
        hyprpanel.overlay
      ];

      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
        nixos-generators.nixosModules.all-formats
        stylix.nixosModules.stylix
        sleepy-dwm.nixosModules.sleepy
        nixos-cosmic.nixosModules.default
        nix-gaming.nixosModules.pipewireLowLatency
        nix-gaming.nixosModules.platformOptimizations
      ];

      templates = import ./templates {};
    };
}

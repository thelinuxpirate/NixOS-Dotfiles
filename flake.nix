{
  description = "TRONG's ThePirateBay NixOS build";

  inputs = {
    # Base Inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = { # Home-Manager
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = { # Snowfall Ecosystem
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = { # ISO Generator
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Extra Inputs
    spicetify-nix = { # Spicetify 
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = { # NixOS Gaming Options
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft = { # Nix-Minecraft (Server)
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft-launcher = { # Nix-Minecraft (Launcher)
      url = "github:12Boti/nix-minecraft";
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
        permittedInsecurePackages = [];
      };

      homes.modules = with inputs; [
        spicetify-nix.homeManagerModules.default
      ];

      overlays = with inputs; [];

      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
      ];

      templates = import ./templates {};
    };
}

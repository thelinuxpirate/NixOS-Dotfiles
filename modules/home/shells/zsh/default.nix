# Zsh shell for users
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.shells.zsh;
in {
  options.shells.zsh = with types; {
    enable = mkBoolOpt false "Whether or not to enable the zsh shell for your user";
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        initExtra = "krabby random -i\n";

        plugins = [
          {
            name = "zsh-autosuggestions";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-autosuggestions";
              rev = "v0.7.0";
              hash = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w="; 
            };
          }
        ];
        
        oh-my-zsh = {
          enable = true;
          theme = "afowler";
        };

        shellAliases = {
          # Misc
          d = "doas";
          s = "sudo";
          t = "tree -A -C";
          ls = "ls --color=auto";
          c = "clear";

          # Nix Maintenance
          rebuild-nixos = "doas nixos-rebuild switch";
          clean-nix = "nix-collect-garbage --delete-old";

          # Nix Deployments
          launch-slippi-cmd = "nix run github:lytedev/ssbm-nix#slippi-netplay";
          rs-nix = "nix run github:cargo2nix/cargo2nix";
          
          # DWM Maintenance
          rebuildthesucc = "cd $HOME/.config/sleepy-dwm/ && doas make clean install && cd slstatus/ && doas make clean install && cd .. && cd dmenu/ && doas make clean install && cd";
          rebuildthewm = "cd $HOME/.config/sleepy-dwm/ && doas make clean install && cd";
          rebuildthebar = "cd $HOME/.config/sleepy-dwm/slstatus/ && doas make clean install && cd";
          rebuildthemenu = "cd $HOME/.config/sleepy-dwm/dmenu/ && doas make clean install && cd";
        };
      };
    };
  };
}

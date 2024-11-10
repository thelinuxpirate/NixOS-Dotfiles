# Programming & development tools
{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.apps.programming;
in {
  options.apps.programming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the programming packages preset";
  };

  config = mkIf cfg.enable {
    home.packages = [
      # TODO work in 'templates' dir & place each devshell
      pkgs.ghc # Haskell
      pkgs.cabal-install
      pkgs.stack
      pkgs.godot_4 # Godot/C#
      pkgs.dotnet-sdk_8
      pkgs.nim # Nim
      pkgs.nimlsp
      pkgs.asdf # Elixir 
      pkgs.zig # Zig
      pkgs.zls
      pkgs.sbcl # Lisp/Scheme
      pkgs.guile_3_0
      pkgs.python311Packages.pip # Python
      pkgs.go # Golang
      pkgs.gcc # C/C++
      pkgs.gnumake
      pkgs.cmake
      pkgs.lua # Lua
      pkgs.nodejs # JS/TS
      pkgs.bun
    ]; 
  };
}

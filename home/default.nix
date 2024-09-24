{ pkgs, ... }:
{
  home = {
    username = "j0rdi";
    homeDirectory = "/Users/j0rdi";
    stateVersion = "24.05";
    packages = pkgs.callPackage ./packages.nix { };
  };

  programs = import ./programs.nix { };

  imports = [ ./modules ];
}

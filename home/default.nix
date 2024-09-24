{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./prompt.nix
    ./yazi.nix
    ./zsh.nix
    ./files.nix
  ];

  home = {
    username = "j0rdi";
    homeDirectory = "/Users/j0rdi";
    stateVersion = "24.05";
    packages = pkgs.callPackage ./packages.nix { };
  };

  programs = import ./programs.nix { };
}

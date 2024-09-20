{
  description = "Jordi's MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager }@inputs:
  let
    configuration = { pkgs, ... }: {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        cowsay
        fastfetch
      ];


    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Jordis-MacBook-Pro
    darwinConfigurations."Jordis-MacBook-Pro" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        ./darwin
        home-manager.darwinModules.home-manager {
          home-manager.backupFileExtension = ".bak"; # for some reason this is not working
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.j0rdi = import ./darwin/home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Jordis-MacBook-Pro".pkgs;
  };
}

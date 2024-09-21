{
  description = "Flake for Jordi's MacBook Pro";

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

  outputs =
    {
      self,
      darwin,
      home-manager,
    }@inputs:
    let
      host = "Jordis-MacBook-Pro";
      system = "aarch64-darwin";
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Jordis-MacBook-Pro
      darwinConfigurations.${host} = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.backupFileExtension = ".bak";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.j0rdi = import ./home;
          }
        ];
        specialArgs = {
          inherit inputs;
        };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.${host}.pkgs;
    };
}

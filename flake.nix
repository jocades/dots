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
    # inputs.fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
  };

  outputs =
    {
      self,
      nixpkgs,
      darwin,
      home-manager,
      # fh,
      ...
    }@inputs:
    let
      host = "Jordis-MacBook-Pro";
      system = "aarch64-darwin";
      rev = self.rev or self.dirtyRev or null;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      darwinConfigurations.${host} = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              users.j0rdi = import ./home;
            };
          }
        ];
        # specialArgs = inputs // {
        #   inherit rev;
        # };

        specialArgs = {
          inherit rev;
          inherit system;
          # inherit fh;
        };

      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.${host}.pkgs;

      # Why not?
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ neovim ];
        shellHook = ''
          export EDITOR=nvim
        '';
      };
    };
}

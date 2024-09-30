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
      nixpkgs,
      darwin,
      home-manager,
    }:
    let
      host = "Jordis-MacBook-Pro";
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      args = {
        inherit system;
        inherit self;
      };
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
              extraSpecialArgs = args;
            };
          }
        ];
        specialArgs = args;

      };

      darwinPackages = self.darwinConfigurations.${host}.pkgs;

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ neovim ];
        shellHook = ''
          export EDITOR=nvim
        '';
      };
    };
}

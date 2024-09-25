{
  self,
  system,
  ...
}:
{
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  # TODO: use dynamic singleton for user, homedir etc...
  users.users.j0rdi.home = "/Users/j0rdi";

  nix = {
    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";

    # Store management
    gc = {
      user = "root";
      automatic = true;
      options = "--delete-older-than 15d";
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    # The platform the configuration will be used on.
    hostPlatform = system;
  };

  imports = [
    ./system.nix
    ./environment.nix
    ./yabai.nix
    ./skhd.nix
  ];
}

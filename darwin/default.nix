{ inputs, ... }:
{
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # Rread the changelog before changing for backward compat.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  users.users.j0rdi.home = "/Users/j0rdi";

  # Store management
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 15d";
    };
    optimise.automatic = true;
  };

  imports = [
    ./system.nix
    ./environment.nix
    ./yabai.nix
    ./skhd.nix
  ];
}

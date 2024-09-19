{ pkgs, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  users.users.j0rdi.home = "/Users/j0rdi";

  imports = [
    ./system.nix
    ./yabai.nix
    ./skhd.nix
  ];
}

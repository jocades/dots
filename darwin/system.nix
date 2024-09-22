{ ... }:
{
  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        _HIHideMenuBar = true;

        # Disable press-and-hold for keys in favor of key repeat
        ApplePressAndHoldEnabled = false;

        # Set a blazingly fast key repeat rate
        InitialKeyRepeat = 15;
        KeyRepeat = 1;
      };

      dock = {
        autohide = true;
        orientation = "bottom";
        show-recents = false;
      };

      # try to make finder actually usable?
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}

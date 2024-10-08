{ ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
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

      loginwindow.GuestEnabled = false;

      # Try to make finder usable
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        FXPreferredViewStyle = "clmv";
      };
    };

    # $ darwin-rebuild changelog (dont change; backwards compat)
    stateVersion = 5;

    # Turn off NIX_PATH warnings now that we're using flakes
    checks.verifyNixPath = false;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}

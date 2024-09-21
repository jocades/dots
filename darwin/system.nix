{ ... }:
{
  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {
      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";

        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
      };

      dock = {
        # Automatically hide and show the Dock
        autohide = true;

        # Style options
        orientation = "bottom";
        show-recents = true;
      };

      loginwindow.LoginwindowText = "calap";

      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}

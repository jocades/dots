{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    pathsToLink = [ "/Applications" ];
  };
}

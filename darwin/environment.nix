{ pkgs, ... }:
{
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    systemPackages = [ pkgs.coreutils ];
    pathsToLink = [ "/Applications" ];
  };
}

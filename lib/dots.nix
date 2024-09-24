{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.dots;
in
{
  options.dots = {
    enable = mkEnableOption "custom dofiles sysmlinking";

    path = mkOption {
      type = types.path;
      description = "Path to dotfiles repo";
    };

    files = mkOption {
      type = types.attrsOf types.path;
      description = "Attribute set of files to symlink";
    };
  };

  config = mkIf cfg.enable {
    home.activation.linkDotfiles =
      let
        mkSymLink =
          name: target: # sh
          ''
            mkdir -p "$(dirname "${config.home.homeDirectory}/${name}")"
            ln -sf "${cfg.path}/{target}" "${config.home.homeDirectory}/${name}"
          '';
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${concatStringsSep "\n" (mapAttrsToList mkSymLink cfg.files)}
      '';

  };
}

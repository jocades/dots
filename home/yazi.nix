{ pkgs, ... }: 
let
 #  yazi-plugins = pkgs.fetchFromGitHub {
	# 	owner = "yazi-rs";
	# 	repo = "plugins";
	# 	rev = "...";
	# 	hash = "sha256-...";
	# };
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
				max_width = 1000;
				max_height = 1000;
			};
    };
    plugins = {
			# chmod = "${yazi-plugins}/chmod.yazi";
			# max-preview = "${yazi-plugins}/max-preview.yazi";
		};
    keymap = {
			manager.prepend_keymap = [
				{
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
				{
					on = "T";
					run = "plugin --sync max-preview";
					desc = "Maximize or restore the preview pane";
				}
			];
		};
  };
}

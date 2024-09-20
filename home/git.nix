{ ... }: {

  programs = {
    git = {
      enable = true;
      userName = "Jordi Calafat";
      userEmail = "jcalafat97@gmail.com";
      ignores = [ ".DS_Store" ];
      aliases = {
        st = "status";
        cm = "commit";
        co = "checkout";
        br = "branch";
      };
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim"; # if set, $GIT_EDITOR will take presedence.
        difftool.prompt = true;
        diff = {
          tool = "nvimdiff";
          guitool = "code";
        };
      };
    };

    gh.enable = true;

    lazygit.enable = true;
  };
}

{ ... }: # ~/.config/git
{
  programs = {
    git = {
      enable = true;
      userName = "Jordi Calafat";
      userEmail = "jcalafat97@gmail.com";
      ignores = [ ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
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

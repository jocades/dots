{ ... }: # ~/.config/git
{
  programs = {
    git = {
      enable = true;
      ignores = [ ".DS_Store" ];
      settings = {
        user = {
          name = "Jordi Calafat";
          email = "jcalafat97@gmail.com";
        };
        init.defaultBranch = "main";
        push.default = "current";
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

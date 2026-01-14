{
  programs.git = {
    enable = true;

    ignores = [
      ".DS_Store"
      "*.d.ts"
      "*.orig"
    ];

    extraConfig = {
      column = {
        ui = "auto";
      };

      branch = {
        sort = "-committerdate";
      };

      tag = {
        sort = "version:refname";
      };

      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };

      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      help = {
        autocorrect = "prompt";
      };

      commit = {
        verbose = true;
      };

      merge = {
        tool = "nvimdiff";
      };

      checkout = {
        defaultRemote = "origin";
      };

      init = {
        defaultBranch = "main";
      };
    };

    aliases = {
      co = "checkout";
      pl = "pull";
      ph = "push";
      cm = "commit";
      cma = "commit --amend";
    };
  };
}

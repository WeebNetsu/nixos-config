{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    # package = pkgs.gitFull;
    settings = {
      user = {
        name = "WeebNetsu";
        email = "stephenvdw7777@gmail.com";
      };

      init.defaultBranch = "main";
      credential.helper = "store";
      pull.rebase = false;
    };
  };
}

{ pkgs, ... }: let
  editor = "nvim";
in {
  # fish specific packages
  home.packages = [ pkgs.babelfish ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR ${editor}

      set -gx PATH $HOME/.local/bin $PATH

      set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzfrc

      starship init fish | source
      atuin init fish | source
      '';
    shellAbbrs = {
      vi = "${editor}";
      vim = "${editor}";
      k = "kubectl";
      kconf = "kubectl config";
      kc = "kubectx";
      kn = "kubens";
      kns = "kubens";
      kz = "kustomize";
      ku = "kustomize";
      guniq = "awk '!seen[\\$1]++'"; # get unique with awk
      gdiff = "git --no-pager diff --no-index"; # git diff but outside of git repos
    };
    shellAliases =  {
      ls = "eza";
    };
  };
}

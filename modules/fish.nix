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

{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR nvim

      set -gx PATH $HOME/.local/bin $PATH
      set -gx PATH $PATH $HOME/.krew/bin

      # disable interactive mode for kubectx/ns
      set -gx KUBECTX_IGNORE_FZF 1

      starship init fish | source
      atuin init fish | source
      '';
    shellAbbrs = {
      vi = "$EDITOR";
      vim = "$EDITOR";
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
    shellAliases=  {
      ls = "eza";
    };
  };
}

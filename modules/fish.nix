{ pkgs, ... }: let
  editor = "nvim";
in {
  # fish specific packages
  home.packages = [ pkgs.babelfish ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source $HOME/.nix-profile/etc/profile.d/nix.fish
      set -gx EDITOR ${editor}
      set -gx PATH $HOME/.local/bin $PATH

      if type -q fnm
        fnm env --use-on-cd --shell=fish | source
      end
      atuin init fish --disable-ctrl-r --disable-up-arrow | source
      starship init fish | source
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

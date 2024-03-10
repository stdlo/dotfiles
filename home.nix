{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "lbickmore";
    homeDirectory = "/Users/lbickmore";
    packages = with pkgs; [
      ansifilter
      atuin
      bat
      colordiff
      eza
      fd
      gh
      jq
      kubectl
      kustomize
      lf
      ripgrep
      sd
      moreutils #sponge
      starship
      tealdeer
      tmux
      wget
      yq
    ];
    file.".config" = { source = ./dot_config; recursive = true; };
    # file.".config/nvim" = { source = "https://github.com/stdlo/init.lua"; };
    file.".gitconfig" = { source = ./dot_gitconfig; };
    file.".tmux.conf" = { source = ./dot_tmux.conf; };
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR nvim

      set -U fish_greeting

      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.krew/bin

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

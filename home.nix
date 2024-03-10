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
    file.".config" = { source = ./home/config; recursive = true; };
    # file.".config/nvim" = { source = "https://github.com/stdlo/init.lua"; };
    file.".gitconfig" = { source = ./home/gitconfig; };
    file.".tmux.conf" = { source = ./home/tmux.conf; };
    # Attempts at getting files from github
    ### one ###
    #     xdg.configFile."fish/themes/Catppuccin Latte.theme".source = let
    #   catppuccin-fish = pkgs.fetchFromGitHub {
    #     owner = "catppuccin";
    #     repo = "fish";
    #     rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    #     hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
    #   };
    # in
    #   "${catppuccin-fish}/themes/Catppuccin Latte.theme";
    ### two ###
    # file.".config/nvim".source = let
    #   nvim = pkgs.fetchFromGitHub {
    #     owner = "stdlo";
    #     repo = "init.lua";
    #   };
    # in 
    #   "${nvim}";
    ### two again
    file.".config/nvim".source = let
      nvim = pkgs.fetchFromGitHub {
        owner = "stdlo";
        repo = "init.lua";
        rev = "main";
        hash = "sha256-/lTUe1blATNwTvGdOaxdcbfndNeWGCsf7PwJ29Rfqys=";
      };
    in 
      "${nvim}";
    ### three ###
    # let
    #   catppuccin-fish = pkgs.fetchFromGitHub {
    #     owner = "catppuccin";
    #     repo = "fish";
    #     rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    #     hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
    #   };
    # in {
    #   xdg.configFile."fish/themes/Catppuccin Latte.theme".source = "${catppuccin-fish}/themes/Catppuccin Latte.theme";
    # }
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR nvim

      # set -U fish_greeting

      set -gx PATH $HOME/.local/bin $PATH
      # set -gx PATH $HOME/.cargo/bin $PATH
      set -gx PATH $PATH $HOME/.krew/bin
      # fish_add_path $HOME/.local/bin
      # fish_add_path $HOME/.krew/bin

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

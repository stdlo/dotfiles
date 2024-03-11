{ pkgs, lib, ... }: let
  inherit (pkgs.stdenv) isLinux isDarwin;
  username = if isDarwin then "lbickmore" else "lo";
  homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
in {
  home = {
    stateVersion = "23.11";
    username = username;
    homeDirectory = homeDirectory;
    file.".config" = { source = ./home/config; recursive = true; };
    file.".gitconfig" = { source = ./home/gitconfig; };
    file.".tmux.conf" = { source = ./home/tmux.conf; };
    ## Disabled for now
    # file.".config/nvim".source = let
    #   nvim = pkgs.fetchFromGitHub {
    #     owner = "stdlo";
    #     repo = "init.lua";
    #     rev = "main";
    #     hash = "sha256-/lTUe1blATNwTvGdOaxdcbfndNeWGCsf7PwJ29Rfqys=";
    #   };
    # in nvim;
  };
  # xdg.configFile."fish/themes/Catppuccin Latte.theme".source = "${catppuccin-fish}/themes/Catppuccin Latte.theme";
  xdg.enable = true;
  programs.home-manager.enable = true;
  imports = [ ./modules/fish.nix ./modules/packages.nix ];
}

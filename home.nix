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

  # setup fonts installed in packages
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [ iosevka mononoki sarasa-gothic ];

  # xdg.configFile."fish/themes/Catppuccin Latte.theme".source = "${catppuccin-fish}/themes/Catppuccin Latte.theme";
  # use ~/.config for config files
  xdg.enable = true;

  # enable home manager
  programs.home-manager.enable = true;

  # local imports for fish config and package installations
  imports = [ ./modules/fish.nix ./modules/packages.nix ];
}

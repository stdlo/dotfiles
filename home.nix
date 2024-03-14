{ pkgs, lib, ... }:

{
  home = {
    stateVersion = "23.11";
    file.".config" = { source = ./home/config; recursive = true; };
    file.".gitconfig" = { source = ./home/gitconfig; };
    file.".tmux.conf" = { source = ./home/tmux.conf; };
    file.".tmux/plugins/tpm".source = pkgs.fetchzip {
      url = "https://github.com/tmux-plugins/tpm/archive/master.tar.gz";
      hash = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
    };
  };

  # setup fonts installed in packages
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [ iosevka mononoki sarasa-gothic ];

  # use ~/.config for config files
  xdg.enable = true;

  programs.home-manager.enable = true;

  imports = [ ./modules/fish.nix ./modules/packages-core.nix ];
}

{ pkgs, lib, ... }:

{
  home = {
    username = "lo";
    homeDirectory = "/home/lo";
  };

  home.packages = with pkgs; [
    curl
    gnumake
    neovim-remote
    # libclang
  ];

  imports = [ ./modules/packages-core.nix ];
}

{ pkgs, lib, ... }:

{
  home = {
    username = "lo";
    homeDirectory = "/home/lo";
  };

  imports = [ ./modules/packages-core.nix ];
}

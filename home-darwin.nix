{ pkgs, lib, ... }:

{
  home = {
    username = "lbickmore";
    homeDirectory = "/Users/lbickmore";
  };

  imports = [ ./modules/packages-core.nix ./modules/packages-work.nix ];
}

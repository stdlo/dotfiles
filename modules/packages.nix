# { pkgs, builtins, ... }: let
#   pkgs = import (builtins.fetchTarball {
#       url = "https://github.com/NixOS/nixpkgs/archive/976fa3369d722e76f37c77493d99829540d43845.tar.gz";
#       sha256 = "sha256:1r6c7ggdk0546wzf2hvd5a7jwzsf3gn1flr8vjd685rm74syxv6d";
#   }) {};
#
#   kubectl = pkgs.kubectl;
# in {
{ pkgs, ... }: {
  home.packages = with pkgs; [
    ansifilter
    atuin
    bat
    colordiff
    eza
    fd
    gh
    jq
    kubectl
    kubectx
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
}

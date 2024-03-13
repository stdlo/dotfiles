{ pkgs, ... }: {
  home.packages = with pkgs; [
    ## core packages
    atuin
    curl
    eza
    fd
    gh
    jq
    lf
    ripgrep
    sd
    starship
    tealdeer
    tmux
    unixtools.watch
    wget
    yq

    ## work packages
    fnm
    ( if pkgs.stdenv.isDarwin
      then pkgs.callPackage ./kubectl-1.27.7.nix { }
      else kubectl )
    kubectx
    kustomize

    ## removed packages
    # ansifilter
    # bat
    # colordiff
    # moreutils #sponge
    # navi
  ];
}

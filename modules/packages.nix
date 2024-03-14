{ pkgs, ... }: {
  home.packages = with pkgs; [
    ## core packages
    atuin
    curl
    eza
    fd
    gh
    git
    jq
    lf
    navi
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
    ( pkgs.callPackage ./multi-gitter.package.nix { } )
    ( if pkgs.stdenv.isDarwin
      then pkgs.callPackage ./kubectl.package.nix { }
      else kubectl )
    kubectx
    kustomize

    ## removed packages
    # ansifilter
    # bat
    # colordiff
    # moreutils #sponge
  ];
}

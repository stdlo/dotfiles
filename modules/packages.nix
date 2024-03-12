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
    kubectl
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

{ pkgs, ... }: {
  home.packages = with pkgs; [
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

    ## removed packages
    # ansifilter
    # bat
    # colordiff
    # moreutils #sponge
  ];
}

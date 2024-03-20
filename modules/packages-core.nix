{ pkgs, ... }: {
  home.packages = with pkgs; [
    atuin
    bat
    curl
    eza
    fd
    fzf
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
    vivid
    wget
    yq

    ## removed packages
    # ansifilter
    # colordiff
    # moreutils #sponge
  ];
}

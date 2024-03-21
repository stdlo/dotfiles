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
    neovim
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
    # colordiff
    # moreutils #sponge
  ];
}

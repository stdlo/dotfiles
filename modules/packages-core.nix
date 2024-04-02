{ pkgs, ... }: {
  home.packages = with pkgs; [
    atuin
    bat
    # disabled until https://github.com/NixOS/nixpkgs/issues/299949
    # curl
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

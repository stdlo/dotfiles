{ pkgs, ... }: {
  home.packages = with pkgs; [
    atuin
    bat
    # disabled until https://github.com/NixOS/nixpkgs/issues/299949
    # curl
    eza
    entr
    fd
    fzf
    gh
    git
    jq
    lf
    # navi
    kubectl
    talosctl
    kubectx
    yt-dlp
    rclone
    rsync
    fnm
    neovim
    ripgrep
    sd
    starship
    tealdeer
    tmux
    unixtools.watch
    # wget
    yq

    ## removed packages
    # ansifilter
    # colordiff
    # moreutils #sponge
  ];
}

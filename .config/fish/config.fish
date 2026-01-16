# only exec once per shell
set -q __fish_config_sourced; and exit
set -g __fish_config_sourced 1

status is-interactive; and begin
    # abbreviations
    abbr --add -- vi $EDITOR
    abbr --add -- vim $EDITOR
    abbr --add -- guniq "awk '!seen[\$1]++'" # get unique with awk
    abbr --add -- gdiff "git --no-pager diff --no-index" # git diff but outside of git repos

    ## k8s
    abbr --add -- k kubectl
    abbr --add -- kconf "kubectl config";
    abbr --add -- kc kubectx
    abbr --add -- kn kubens
    abbr --add -- kns kubens
    abbr --add -- kz kustomize
    abbr --add -- ku kustomize

    # aliases
    alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    if type -q eza
        alias ls eza
    end

    # interactive shell init
    set -gx EDITOR nvim
    set -gx PATH $HOME/.local/bin $PATH

    if type -q fnm
        fnm env --use-on-cd --shell=fish | source
    end
    if type -q atuin
        atuin init fish --disable-ctrl-r --disable-up-arrow | source
    end
    if type -q starship
        starship init fish | source
    end
end

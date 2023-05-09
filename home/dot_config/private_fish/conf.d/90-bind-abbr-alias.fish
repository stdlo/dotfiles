# aliases
alias ls="exa"


# abbreviations
abbr vi $EDITOR
## common commands
#abbr py "ptpython"
#abbr dc "docker-compose"
## kubernetes
abbr k kubectl
abbr kconf kubectl config
## chezmoi
abbr cm chezmoi
abbr cma chezmoi add
abbr cmap chezmoi apply
abbr cmd chezmoi diff
abbr cme chezmoi edit
abbr cmg chezmoi git
abbr cmu chezmoi update
## get unique with awk
abbr guniq "awk '!seen[\$1]++'"
## git diff but outside of git repos
abbr gdiff "git --no-pager diff --no-index"


# bindings
bind \cX\cE __edit_commandline

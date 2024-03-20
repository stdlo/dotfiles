status --is-interactive; or exit 0

set -gx LS_COLORS "$(vivid generate rose-pine-moon)"

starship init fish | source
atuin init fish --disable-ctrl-r --disable-up-arrow | source

# from: fzf --fish
# version: 0.48.1
# added atuin history, ref: https://github.com/atuinsh/atuin/issues/68
function _fzf_atuin_history -d "Show command history"
  test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
  begin
    set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS +m"
    atuin history list --cmd-only --reverse=false | __fzf_wrapper -q (commandline) --prompt="history > " | read -l result
    and commandline -- $result
  end
  commandline -f repaint
end

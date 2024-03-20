function __fzf_wrapper
  ## from: PatrickF1/fzf.fish
  # Make sure fzf uses fish to execute preview commands, some of which
  # are autoloaded fish functions so don't exist in other shells.
  # Use --function so that it doesn't clobber SHELL outside this function.
  set -f --export SHELL (command --search fish)


  # from: fzf --fish
  test -n "$FZF_TMUX"; or set FZF_TMUX 0
  test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
  if [ -n "$FZF_TMUX_OPTS" ]
    # echo "fzf-tmux $FZF_TMUX_OPTS -- "
    fzf-tmux $FZF_TMUX_OPTS -- $argv
  else if [ $FZF_TMUX -eq 1 ]
    # echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
    fzf-tmux -d$FZF_TMUX_HEIGHT -- $argv
  else
    # echo "fzf"
    fzf $argv
  end
end

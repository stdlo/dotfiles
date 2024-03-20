status --is-interactive; or exit 0
# rose-pine/fzf: rose-pine-moon
set -gx FZF_DEFAULT_OPTS (string join -n ' ' '
  --border=none
  --cycle
  --height=~40%
  --marker="*"
  --no-info
  --preview-window=wrap
  --reverse
  --preview="bat -p"
  --preview-window=border-none,hidden
  --bind "ctrl-t:toggle-preview"
  --color=fg:#908caa,bg:#232136,hl:#ea9a97
  --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
  --color=border:#44415a,header:#3e8fb0,gutter:#232136
  --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
  --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
')

#| sd '^#.*$' '' | string join -n ' ')

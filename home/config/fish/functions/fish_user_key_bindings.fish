function fish_user_key_bindings
  bind \cr _fzf_atuin_history
  bind \ct _fzf_search_directory
  bind \e\cl _fzf_search_git_log

  # if bind -M insert > /dev/null 2>&1
  #   bind -M insert \cr _fzf_atuin_history_widget
  #   bind -M insert \e\cl _fzf_git_status_widget
  # end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    #bind \cC 'if test -z (commandline); echo -n; commandline | cat; commandline ""; commandline -f repaint; else; commandline -f cancel-commandline; end'
end

starship init fish | source
fnm env --use-on-cd | source
navi widget fish | source
#thefuck --alias | source

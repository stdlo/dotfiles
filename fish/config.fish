if status is-interactive
    # Commands to run in interactive sessions can go here
    #bind \cC 'if test -z (commandline); echo -n; commandline | cat; commandline ""; commandline -f repaint; else; commandline -f cancel-commandline; end'
end

set PATH /usr/local/bin $PATH
starship init fish | source
thefuck --alias | source

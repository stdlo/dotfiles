set -gx PATH /usr/local/bin $PATH
set -gx EDITOR nvim

switch (uname -a)
    case "*microsoft*"
        set -gx BROWSER wslview
        set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
    case "Linux*"
        set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
    case "Darwin*"
	set -gx PATH /opt/homebrew/bin $PATH
    case '*'
end

> I cloned and I want to get all the plugins!
 - `git submodule update --init --recursive`
> Stupid submodule, gtfo!
 - [How to delete a submodule](https://davidwalsh.name/git-remove-submodule)
> That super cool submodule got an update and I want it!
 - `git submodule foreach git pull origin master`
> Quick! Add all the submodules back!
```
git submodule add git@github.com:tpope/vim-pathogen bundle/vim-pathogen
git submodule add git@github.com:loganbickmore/syntax bundle/syntax
git submodule add git@github.com:tpope/vim-unimpaired bundle/vim-unimpaired
git submodule add git@github.com:qpkorr/vim-bufkill bundle/vim-bufkill
git submodule add git@github.com:vim-airline/vim-airline bundle/vim-airline
git submodule add git@github.com:scrooloose/nerdtree bundle/nerdtree
git submodule add git@github.com:Xuyuanp/nerdtree-git-plugin bundle/nerdtree-git-plugin
git submodule add git@github.com:vim-airline/vim-airline-themes bundle/vim-airline-themes
git submodule add git@github.com:ryanoasis/vim-devicons bundle/vim-devicons
```
> symlinks for nyaovim on windows?
```
mklink /H %USERPROFILE%\AppData\Roaming\NyaoVim\nyaovimrc.html %USERPROFILE%\.config\nvim\lib\nyaovim\nyaovimrc.html
mklink /H %USERPROFILE%\AppData\Roaming\NyaoVim\browser-config.json %USERPROFILE%\.config\nvim\lib\nyaovim\browser-config.json
```

# Setup Instructions
### 1. Environment Setup
#### Linux
```shell
mkdir $HOME/.config
mkdir $HOME/.config/nvim
mkdir $HOME/.config/nvim/bundle
mkdir $HOME/.config/nvim/autoload
XDG_CONFIG_HOME=$HOME/.config
nvim=$XDG_CONFIG_HOME/nvim
```
#### Windows
```shell
mkdir %USERPROFILE%\.config
mkdir %USERPROFILE%\.config\nvim
mkdir %USERPROFILE%\.config\nvim\bundle
mkdir %USERPROFILE%\.config\nvim\autoload
setx /M XDG_CONFIG_HOME "%USERPROFILE%\.config"
set nvim=%XDG_CONFIG_HOME%\nvim
```
**Setup Alias'**
add to conemu settings > startup > environment
```
alias vim=nvim.exe $*
alias vi=nvim.exe $*
alias gvim=nvim-qt.exe $*
alias gvi=nvim-qt.exe $*
```
**Delete persistent global variables**
`REG delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /F /V FOOBAR`

### 2. Basic Install
- [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [pathogen](https://github.com/tpope/vim-pathogen) -> `curl -LSso $nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`
- [sudo font](https://github.com/jenskutilek/sudo-font)
- https://github.com/powerline/fonts/tree/master/FiraMono
- http://madmalik.github.io/mononoki/
- https://www.fontsquirrel.com/fonts/m-1m https://mplus-fonts.osdn.jp/about-en.html

### 3. Plugin Install
- [dracula theme](https://draculatheme.com/vim/) -> `git submodule add git@github.com:dracula/vim.git $nvim/bundle/dracula-theme`
- [airline](https://github.com/vim-airline/vim-airline) and [airline themes](https://github.com/vim-airline/vim-airline-themes)
  - `git clone https://github.com/vim-airline/vim-airline $nvim/bundle/vim-airline`
  - `git clone https://github.com/vim-airline/vim-airline-themes $nvim/bundle/bundle\vim-airline-themes`

### 4. Install Custom init.vim & ginit.vim


# commands
```
cd nvim
mkdir autoload
curl -LSso autoload/pathogen.vim https://tpo.pe/pathogen.vim -k
git submodule add git@github.com:dracula/vim.git bundle/dracula-theme
git submodule add git@github.com:vim-airline/vim-airline bundle/vim-airline
git submodule add git@github.com:vim-airline/vim-airline-themes bundle/vim-airline-themes
git submodule add git@github.com:scrooloose/nerdtree bundle/nerdtree
git submodule add git@github.com:Xuyuanp/nerdtree-git-plugin bundle/nerdtree-git-plugin


```

# useful links
https://shapeshed.com/vim-netrw/#netrw-the-unloved-directory-browser
https://superuser.com/questions/421463/why-does-ctrl-v-not-paste-in-bash-linux-shell
http://vim.wikia.com/wiki/Alternative_tab_navigation
https://superuser.com/a/771555
http://howivim.com/2016/andy-stewart/ && https://github.com/airblade/dotvim/blob/master/gvimrc && https://github.com/airblade

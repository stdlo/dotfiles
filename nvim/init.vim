" defaults
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set number
set nobackup
set noswapfile
set wildmenu
set mouse=a
if &compatible
  set nocompatible
endif
" tab v spaces config https://stackoverflow.com/a/234578/4863857
filetype plugin indent on
set tabstop=4
set shiftwidth=2
set expandtab

" define plugins
"let s:plugins_depends = [ 'Shougo/unite.vim' ]
let s:plugins = [
  \'sheerun/vim-polyglot',
  \'ayu-theme/ayu-vim',
  \'vim-airline/vim-airline',
  \'airblade/vim-gitgutter',
  \'janko-m/vim-test',
  \'scrooloose/nerdtree',
  \'tiagofumo/vim-nerdtree-syntax-highlight',
  \'Xuyuanp/nerdtree-git-plugin',
  \'roxma/nvim-yarp',
  \'roxma/vim-hug-neovim-rpc',
  \'prettier/vim-prettier',
  \'wokalski/autocomplete-flow',
  \'Shougo/deoplete.nvim'
\]
"" Disabled plugins
"\'ryanoasis/vim-devicons',
"\'vim-airline/vim-airline-themes',
"\'qpkorr/vim-bufkill',
"\'tpope/vim-unimpaired',
"\'tpope/vim-sensible',

"" enable dein.vim and install plugins
set runtimepath+=~/.config/nvim/lib/dein.vim
let s:plugin_dir = expand('~/.config/nvim/lib/plugins')
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  " install dependencies
  "for p in s:plugins_depends
    "call dein#add(p)
  "endfor

  " install plugins
  for p in s:plugins
    call dein#add(p)
  endfor

  " end and perform install
  " if new plugins exist
  call dein#end()
  call dein#save_state()
  if dein#check_install()
    call dein#install()
  endif
endif

"" post plugin setup

" enable deoplete
let g:deoplete#enable_at_startup = 1

" enable theme
syntax on
" setup ayu
set termguicolors
let ayucolor="mirage"
colorscheme ayu

set colorcolumn=80
"" remaps
" set leader to , and \
let mapleader=","
nmap \ ,
nnoremap ; :
" quick save
"noremap <Leader>s :update<CR>
" copy paste shortcuts
"noremap <Leader>v "+p
"noremap <Leader>V "+P
noremap <Leader>c "*y<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <S-Tab>   :bprevious<CR>
nnoremap <Tab>     :bnext<CR>
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" close current buffer
nnoremap <C-W> :bdelete<CR>
" close all but current buffer
nnoremap <Leader>w :%bdelete\|e#<CR>
nnoremap <Leader>s :echo hello world<CR>
" Quick write session with F2
nnoremap <F2> :call MakeSession()<CR>
" And load session with F3
nnoremap <F3> :execute "silent! source ~/.nvim_session"\|echo "Loaded ~/.nvim_session."<CR>
" Reload vimrc and refresh all buffers
nnoremap <F5> :so $MYVIMRC\|bufdo e<CR>
function! MakeSession()
  if IsNerdTreeEnabled()
    execute "NERDTreeClose"
    execute "mksession! ~/.nvim_session"
    execute "NERDTreeToggle"
    execute "wincmd p"
  elseif IsNerdTreeFocused()
    execute "NERDTreeClose"
    execute "mksession! ~/.nvim_session"
    execute "NERDTreeToggle"
  else
    execute "mksession! ~/.nvim_session"
  endif
  echo "Created new session at ~/.nvim_session. To load session press <F3>."
endfunction

"" plugin remaps
nnoremap <C-\> :call HandleTree()<CR>
function! IsNerdTreeEnabled()
  return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! IsNerdTreeFocused()
  return exists('t:NERDTreeBufName') && bufname("") == t:NERDTreeBufName
endfunction

function! HandleTree()
  if IsNerdTreeFocused()
    execute "NERDTreeClose"
  elseif IsNerdTreeEnabled()
    execute "NERDTreeFocus"
  else
    execute "NERDTreeToggle"
    "echo 'Nothing VimFiler and NERDTree were not loaded!'
    "execute "Lexplore \<bar> vertical resize 30"
  endif
endfunction

"" Plugin Config "
" prettier
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.json,*.md PrettierAsync

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
" quit vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" gitgutter
set signcolumn=yes
set updatetime=250

" airline
set laststatus=2
" only display the filename in tabline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
set noshowmode

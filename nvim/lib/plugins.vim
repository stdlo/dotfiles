" define plugins
"let s:plugins_depends = [ 'Shougo/unite.vim' ]
let s:plugins = [
  \'junegunn/limelight.vim',
  \'sheerun/vim-polyglot',
  \'prettier/vim-prettier',
  \'ayu-theme/ayu-vim',
  \'airblade/vim-gitgutter',
  \'itchyny/lightline.vim',
  \'itchyny/vim-gitbranch',
  \'scrooloose/nerdtree',
  \'tiagofumo/vim-nerdtree-syntax-highlight',
  \'Xuyuanp/nerdtree-git-plugin',
  \'roxma/nvim-yarp',
  \'roxma/vim-hug-neovim-rpc',
  \'wokalski/autocomplete-flow',
  \'Shougo/deoplete.nvim'
\]
"" Disabled plugins
"\'ryanoasis/vim-devicons',
"\'vim-airline/vim-airline',
"\'janko-m/vim-test',
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

"" Plugin Config

" enable deoplete
let g:deoplete#enable_at_startup = 1

" ayu
let ayucolor="mirage"

" prettier
" map function
nnoremap <Leader>f :PrettierAsync<CR>
" disable autoformat
let g:prettier#autoformat = 0

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
" quit vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" gitgutter
set signcolumn=yes
set updatetime=250

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \     'right': [ [ 'gitbranch', 'column' ] ],
  \     'left': [ [ 'mode', 'paste' ],
  \               [ 'readonly', 'relativepath'],
  \               [ 'modified'] ]
  \ },
  \ 'inactive': { 'right': [], 'left':  [ [ 'relativepath' ] ] },
  \ 'component_function': {
  \     'readonly': 'LightlineReadonly',
  \     'mode': 'LightlineMode',
  \     'modified': 'LightlineModified',
  \     'gitbranch': 'LightlineGitbranch'
  \ },
  \ }

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|nerdtree)' ? '!!' : ''
endfunction

function! LightlineMode()
  return &filetype !~# '\v(help|nerdtree)' ? lightline#mode() : ''
endfunction

function! LightlineGitbranch()
  return &filetype !~# '\v(help|nerdtree)' ? gitbranch#name() : ''
endfunction

function! LightlineModified()
  return &filetype =~# '\v(help|nerdtree)' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

"" enable plug and install plugins
" https://github.com/junegunn/vim-plug/wiki/tutorial#setting-up
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete helper
Plug 'Shougo/neco-syntax'

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'ayu-theme/ayu-vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'wokalski/autocomplete-flow' " snippets 
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc' " not sure what this is

"" Disabled plugins
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'junegunn/limelight.vim'
"Plug 'prettier/vim-prettier'
"Plug 'ryanoasis/vim-devicons'
"Plug 'vim-airline/vim-airline'
"Plug 'janko-m/vim-test'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'qpkorr/vim-bufkill'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-sensible'

call plug#end()

"" Plugin Config

"" deoplete
let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><C-g>       deoplete#refresh()
inoremap <expr><C-e>       deoplete#cancel_popup()
inoremap <silent><expr><C-l>       deoplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction

"" ayu
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

"" autoformat
nnoremap <Leader>f :Autoformat<CR>

" disable built-in autoformat
let g:prettier#autoformat = 0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
"" end autoformat

"" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
" quit vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"" gitgutter
set signcolumn=yes
set updatetime=250

"" lightline
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

" defaults
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set number
set nobackup
set noswapfile
if &compatible
	set nocompatible
endif

" let leader = , and \
let mapleader=","
nmap \ ,


" define plugins
let s:plugins_depends = [ 'Shougo/unite.vim' ]
let s:plugins = [
	\'tpope/vim-unimpaired',
	\'qpkorr/vim-bufkill',
	\'vim-airline/vim-airline-themes',
	\'sheerun/vim-polyglot',
	\'rhysd/vim-color-spring-night',
	\'ayu-theme/ayu-vim',
	\'vim-airline/vim-airline',
	\'ryanoasis/vim-devicons',
	\'Shougo/vimfiler.vim',
	\'d42/vimfiler_git.vim',
	\'dracula/vim',
	\'Shougo/deoplete.nvim',
	\'roxma/nvim-yarp',
	\'roxma/vim-hug-neovim-rpc'
\]

" enable dein.vim and install plugins
set runtimepath+=~/.config/nvim/lib/dein.vim
let s:plugin_dir = expand('~/.config/nvim/lib/plugins')
if dein#load_state(s:plugin_dir)
	call dein#begin(s:plugin_dir)

	" install dependencies
	for p in s:plugins_depends
		call dein#add(p)
	endfor

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

" post plugin setup
filetype plugin indent on

" enable deoplete
let g:deoplete#enable_at_startup = 1

" enable theme
syntax on
" setup ayu
set termguicolors
let ayucolor="mirage"
colorscheme ayu
"let g:dracula_colorterm = 0
"colorscheme dracula

"" remaps
nnoremap ; :
noremap <Leader>s :update<CR>
noremap <Leader>v "+p
noremap <Leader>V "+P
noremap <Leader>c "+y
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


" plugin remaps
nnoremap <C-\> :call Tree()<CR>
function! Tree()
	if exists(":VimFiler")
		execute "VimFilerExplorer"
	elseif exists(":NERDTree")
		execute "NERDTreeToggle"
	else
		echo 'Nothing VimFiler and NERDTree were not loaded!'
		"execute "Lexplore \<bar> vertical resize 30"
	endif
endfunction

" Plugin Config "
" airline
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
set noshowmode
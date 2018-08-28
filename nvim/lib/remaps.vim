"" remaps
" set leader to , and \
let mapleader=","
nmap \ ,
nnoremap ; :
" copy paste shortcuts from system clipboard
noremap <Leader>p "*p
noremap <Leader>y "*y<CR>

" tab and buffer nav
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
nnoremap <S-Tab>   :bprevious<CR>
nnoremap <Tab>     :bnext<CR>

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" close current buffer
"nnoremap <C-W> :bdelete<CR>
" close all but current buffer
nnoremap <Leader>w :%bdelete\|e#<CR>

" example map for kicks
nnoremap <Leader>s :echo 'hello world'<CR>

" Write session with F2
nnoremap <F2> :call MakeSession()<CR>
" Load session with F3
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


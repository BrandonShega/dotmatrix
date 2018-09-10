nnoremap <C-j> <C-w>j
nnoremap Q :quit<CR>
nnoremap W :write<CR>
noremap j gj
noremap k gk
nnoremap <C-u> 10<C-u>
nnoremap H ^
nnoremap <C-o> <C-o>zz
nnoremap ; :
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
nnoremap <C-d> 10<C-d>
nnoremap <silent> n :call NextAndCenter('n')<CR>
nnoremap <silent> N :call NextAndCenter('N')<CR>
nnoremap gx :call netrw#BrowseX(expand('<cfile>'), 0)<CR>
nnoremap Y y$
noremap gk k
noremap <Up> gk
noremap gj j
noremap <Down> gj
noremap K <Nop>
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>
nnoremap <CR> o<Esc>
noremap <F1> <Nop>
nnoremap <leader>pt :!prettier %<CR>

" Running as diff
if &diff
  if tabpagenr('$') == 1
    nnoremap ZZ :wqall<CR>
  endif
else
  " Jump to next/previous merge conflict marker
  nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
  nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>
endif

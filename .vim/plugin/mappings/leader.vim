nnoremap <leader><leader> <C-^>
nnoremap <silent> <leader>4 :let @/=""<CR>
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>
inoremap <leader>\ <C-X><C-O>
nnoremap <silent> <leader>q :call <SID>CloseLists()<CR>
nnoremap <leader>b :Xbuild<CR>
nnoremap <leader>u :Xtest<CR>
nnoremap <leader>r :Xrun<CR>
nnoremap <leader>c :Xclean<CR>
nnoremap <leader>o :Xopen<CR>
nnoremap <leader>kr :VtrKillRunner<CR>
nnoremap <leader>ar :VtrAttachToPane<CR>
nnoremap <leader>fr :VtrFocusRunner<CR>
nnoremap <leader>rr :VtrSendCommandToRunner! !!<CR>

" nnoremap <silent><leader>ff :<C-u>Denite -start-filter file/rec<CR>
" nnoremap <silent><leader>pf :<C-u>DeniteBufferDir -start-filter file/rec<CR>
" nnoremap <silent><leader>bb :<C-u>Denite buffer<CR>
" nnoremap <silent><leader>fr :<C-u>Denite file_mru<CR>
" nnoremap <silent><leader><leader> :<C-u>DeniteBufferDir -start-filter file/rec<CR>

if has('nvim')
  call denite#custom#option('_', {
    \ 'statusline': 0,
    \ 'split': 'floating',
    \ 'floating_preview': 1,
    \ 'filter_split_direction': 'floating'
    \ })
endif

if executable('ag')
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '-U', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'default_opts',
        \ [ '--skip-vcs-ignores', '--vimgrep', '--smart-case', '--hidden' ])

elseif executable('rg')
  " Ripgrep
  call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--no-heading'])

elseif executable('ack')
  " Ack command
  call denite#custom#var('grep', 'command', ['ack'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--match'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'default_opts',
      \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
      \ '--nopager', '--nocolor', '--nogroup', '--column'])
endif

augroup user_plugin_denite
  autocmd!

  autocmd FileType denite call s:denite_settings()
  autocmd User denite-preview call s:denite_preview()

  autocmd WinEnter * if &filetype =~# '^denite'
        \ | highlight! link CursorLine WildMenu
        \ | endif

  autocmd WinEnter * if &filetype ==# 'denite'
        \ | highlight! link CursorLine NONE
        \ | endif

augroup END

function! s:denite_settings() abort
  setlocal signcolumn=no cursorline

  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q    denite#do_map('quit')
  nnoremap <silent><buffer><expr> v    denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> s    denite#do_map('do_action', 'split')
endfunction

function! s:denite_preview() abort
  setlocal nocursorline colorcolumn= signcolumn=no nonumber nolist nospell

  if &lines > 35
    resize +8
  endif

  if exists('*indent_guides#clear_matches')
    call indent_guides#clear_matches()
  endif
endfunction

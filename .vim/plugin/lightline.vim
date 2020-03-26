let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active' : {
  \   'left' : [ [ 'mode', 'paste' ],
  \              [ 'readonly', 'filename', 'gitbranch', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ }
  \ }

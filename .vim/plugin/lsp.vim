let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'ruby': ['solargraph', 'stdio']
  \ }

let g:LanguageClient_rootMarkers = {
  \ 'javascript': ['jsconfig.json'],
  \ 'typescript': ['tsconfig.json']
  \ }

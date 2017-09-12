autocmd! BufWritePost * Neomake
let g:neomake_cpp_clang_maker = {
            \ 'args': ['-fsyntax-only', '-std=c++14', '-Wall', '-Wextra'],
            \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
            \ }
let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'args': ['--checks="modernize-*,readability-*,misc-*,clang-analyzer-*"'],
            \ 'errorformat':
            \ '%f:%l:%c: fatal error: %m,' .
            \ '%f:%l:%c: Error: %m,' .
            \ '%f:%l:%c: Warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ }

let g:neomake_cpp_enabled_makers = ['clang', 'clangtidy']

"augroup my_neomake_highlights
"  au!
"  autocmd ColorScheme *
"    \ hi link NeomakeError ctermfg=red |
"    \ hi link NeomakeWarning ctermfg=red |
"    \ hi link NeomakeInfo ctermfg=white |
"    \ hi link NeomakeMessage ctermfg=white
"augroup END

"augroup my_neomake_signs
"  au!
"  autocmd ColorScheme *
"    \ hi NeomakeErrorSign ctermfg=red |
"    \ hi NeomakeWarningSign ctermfg=red |
"    \ hi NeomakeInfoSign ctermfg=white |
"    \ hi NeomakeMessageSign ctermfg=white
"augroup END

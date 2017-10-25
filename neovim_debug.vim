" For Pathogen plugin manager
" debug directory for including plugins for bug reproduction.
call pathogen#infect('debug/{}')
call pathogen#helptags()

" Enable filetype plugin
filetype plugin on
filetype indent on
syntax on

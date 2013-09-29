execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

sytax on
filetype plugin indent on

"vim settings"
"Line numbers, and tab width"
set number
set nuw=2

"Indenting"
set autoindent
set smartindent
set cindent

"More tab sizes."
set ts=2 "tab size"
set sw=2 "Shift width"
set et

"Misc settings."
set sta
set showmatch "show matching parentheses"
set autowrite

"Vim color settings."
colorscheme blacklight

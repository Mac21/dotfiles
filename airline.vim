let g:airline_powerline_fonts=1
let g:airline_theme='violet'
set noshowmode
set laststatus=2

let g:airline_section_z = airline#section#create([g:airline_symbols.maxlinenr, ' %l/%L', ':%2v'])
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

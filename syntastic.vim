set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages={"level": "warnings"}
let g:syntastic_check_on_open=1
let g:syntastic_asm_checkers=[""]
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler_options='--std=c++14'
let g:syntastic_cpp_gcc_checker=1
let g:syntastic_c_check_header=1
let g:syntastic_c_compiler_options='--std=c11'
let g:syntastic_c_gcc_checker=1

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin,*.o let &bin=1
  au BufReadPost *.bin,*.o if &bin | %!xxd
  au BufReadPost *.bin,*.o set ft=xxd | endif
  au BufWritePre *.bin,*.o if &bin | %!xxd -r
  au BufWritePre *.bin,*.o endif
  au BufWritePost *.bin,*.o if &bin | %!xxd
  au BufWritePost *.bin,*.o set nomod | endif
augroup END

" define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!~/dev/perltidy.sh

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
  let l = line(".")
  let c = col(".")
  :Tidy
  call cursor(l, c)
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nmap <F5> :call DoTidy()<CR>

"shortcut for visual mode to run on the current visual selection"
au FileType perl vmap <F5> :Tidy<CR>

" set correct indent settings for perl
au BufEnter *.pl :set shiftwidth=4
au BufEnter *.pm :set shiftwidth=4
"filetype plugin indent on
autocmd FileType perl setlocal equalprg=/home/ms/dev/perltidy.sh

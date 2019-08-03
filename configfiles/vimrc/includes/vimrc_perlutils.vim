function! Insert_perl_comment()
  let line = getline(".")
  let funname = substitute(line, '^sub\s\+\([a-zA-Z0-9]\+\)', '\1', "g")
  "let function_name = matches[0]

  let comment="# ----------------------------------------------------------------------------\n
\#\n
\#   ".funname."\n
\#\n
\#   DESCRIPTION\n
\#\n
\#   ret                   RETVAL\n
\#\n\n"

  :set paste
  :-1put =comment
  :set nopaste
  :.-5
  let lnum = search('DESCRIPTION')
  :normal viw

endfunction

nmap <F6> :call Insert_perl_comment()<CR>

set cindent
set shiftwidth=4
set cinoptions=>1s,{1s,(1s,f1s


let s:save_cpo = &cpo
set cpo&vim

if !exists('g:osquery_complete_types')
  let g:osquery_complete_types = ['specs', 'windows', 'posix', 'linux', 'darwin', 'utility' ]
endif

if !exists('g:syntastic_osquery_checkers')
        let g:syntastic_osquery_checkers = ['osqueryi']
endif

setlocal omnifunc=osquery#complete
silent! map <unique> <buffer> <Leader>rr :call osquery#run()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

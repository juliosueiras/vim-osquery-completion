let s:save_cpo = &cpo
set cpo&vim

if !exists('g:syntastic_osquery_checkers')
        let g:syntastic_osquery_checkers = ['osqueryi']
endif

set omnifunc=osquery#complete
silent! map <unique> <buffer> <Leader>rr :call osquery#run()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

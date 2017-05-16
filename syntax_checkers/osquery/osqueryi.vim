"============================================================================
"File:        osqueryi.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Julio Tain Sueiras <juliosueiras@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_osquery_osqueryi_checker')
    finish
endif
let g:loaded_syntastic_osquery_osqueryi_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_osquery_osqueryi_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args_before': '<' })

    let errorformat =
        \ 'Error: near line %l: %m'

    let env = syntastic#util#isRunningWindows() ? {} : { 'TERM': 'dumb' }

    return SyntasticMake({
        \ 'defaults': { 'bufnr': bufnr('') },
        \ 'makeprg': makeprg,
        \ 'cwd': expand('%:p:h'),
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'osquery',
    \ 'name': 'osqueryi',
    \ 'exec': 'osqueryi'})

let &cpo = s:save_cpo
unlet s:save_cpo

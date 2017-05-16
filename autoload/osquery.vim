if !has("ruby") && !has("ruby/dyn")
    finish
endif

if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'osquery')
else
    let g:syntastic_extra_filetypes = ['osquery']
endif

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

fun! osquery#run()
    let file = expand('%')
    botright new
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal nowrap
    setlocal noswapfile
    execute ':r!osqueryi < ' . file
    noremap <silent><buffer> q :q<CR>
endfunc


fun! osquery#complete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
      try
          let a:line = strpart(getline('.'),0, getpos('.')[2])

          let res = []
          ruby<<EOF
          require 'json'

          test = JSON.parse(File.read("#{VIM::evaluate('s:path')}/../datas/complete.json"))

          test2 = VIM::evaluate('a:line')

          if test2[/\s*SELECT(?!.*FROM)/]
              test.each do |i| 
              if i['word'] == VIM::evaluate("getline('.')").match(/FROM\s*([^ ;]*);?/)[1]
                  VIM::command("let res = #{JSON.generate(i['columns'])}")
                  break
              end
          end
      else
          VIM::command("let res = #{JSON.generate(test)}")
      end
EOF
      return res
  catch
      return []
  endtry
  end
endfun

function! asyncomplete#sources#shellcommand#completor(opt, ctx)
  let l:name = a:opt['name']
  let l:col = a:ctx['col']
  let l:typed = a:ctx['typed']

  let l:kw = matchstr(l:typed, '\w\+$')
  let l:kwlen = len(l:kw)
  let l:startcol = l:col - l:kwlen

  let l:command_name_all = "g:asyncomplete#sources#shellcommand#command"
  let l:command_name_ft = "g:asyncomplete#sources#shellcommand#" . &ft . "#command"

  if exists(l:command_name_all)
    let l:command_name = l:command_name_all
  elseif exists(l:command_name_ft)
    let l:command_name = l:command_name_ft
  endif

  if !exists(l:command_name)
    call asyncomplete#complete(l:name, a:ctx, l:startcol, [])
    return
  endif

  let l:command = eval(l:command_name)
  let l:command = substitute(l:command, "${token}", l:typed, "g") 

  let l:words = split(system(l:command), "\n")

  let l:matches = map(l:words, '{"word": v:val, "menu": "[" . l:name . "]"}')

  call asyncomplete#complete(l:name, a:ctx, l:startcol, l:matches)
endfunction

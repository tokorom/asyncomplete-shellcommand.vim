# asyncomplete-shellcommand

Completion using a custom shell command for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)

## Requirement

- asyncomplete.vim

## Usage

```vim
" Use for all file types
let g:asyncomplete#sources#shellcommand#command = 'ag ${token} | grep -o "[[:alnum:]]\+" | fzy -e ${token} | uniq'
" let g:asyncomplete#sources#shellcommand#swift#command = 'This command is only used when filetype is swift'

call asyncomplete#register_source({
    \ 'name': 'custom',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#shellcommand#completor'),
    \ })
```

- `${token}` in the command will be replaced by the actual keyword you typed

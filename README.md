# A Vim OSQuery Completion Plugin

A Very early prototype(is not full feature yet)

__For now I am using file extension *.osq to not overlap with current sql of vim__

## Demo

[![asciicast](https://asciinema.org/a/120744.png)](https://asciinema.org/a/120744)


```vim
set completeopt+=preview " For info preview

" (Optional, default to all) Enable which categories to complete
let g:osquery_complete_types = ['specs', 'windows', 'posix', 'linux', 'darwin', 'utility' ]

```

## Todolist
- [X] Run Query(`<leader>rr`)
- [X] Linter integraded
- [ ] Inform Platform
- [ ] Multiline support
- [ ] JSON Schema for OSQuery

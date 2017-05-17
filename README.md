# A Vim OSQuery Completion Plugin

A Very early prototype(is not full feature yet)

__For now I am using file extension *.osq to not overlap with current sql of vim__

## Demo

[![asciicast](https://asciinema.org/a/120744.png)](https://asciinema.org/a/120744)


## Instruction
- For AutoCompletion , open a file that end with *.osq(this is just a temp solution), and  type Ctrl-X, and Ctrl-O after `FROM` for table completion , and move to `SELECT ^ FROM table_name` for column completion(^ being your cursor)
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

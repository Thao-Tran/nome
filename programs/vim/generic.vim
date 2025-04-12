" Put swap and backup files into dedicated directories
set directory=~/.vim/swapfiles backupdir=~/.vim/backups
" Enable line numbering
set number
" Enable automatically reloading open file if it's been changed outside of Vim
set autoread
" Enable spell check
set spell
" Use 2 spaces for indentation and tab characters will show as 8 chars
set expandtab shiftwidth=2 tabstop=8
" Display $ for trailing whitespace and > for indentation
set list listchars=trail:$,multispace:\ >
" Format trailing whitespace as an error
match ErrorMsg '\s\+$'
" Display a line at col 81
set colorcolumn=81

" Enable filetype detection
filetype on
" Enable loading plugins for specific filetypes
filetype plugin on
" Enable loading the indent file for specific filetypes
filetype indent on

" Enable syntax highlighting
syntax on

" Use kj character sequence to go from interactive mode to normal mode
imap kj <Esc>
" Use space to go from normal mode to command mode
map <Space> :

if (has("termguicolors"))
  set termguicolors
endif

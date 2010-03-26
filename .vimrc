" Don't try to be like vi
set nocompatible

" Backspace should work across lines
set bs=2

" Read files from ~/.vim
source ~/.vim/state.vim
source ~/.vim/display.vim
source ~/.vim/indent.vim
source ~/.vim/macros.vim
source ~/.vim/commenter.vim
source ~/.vim/filetypes.vim
if !filereadable(expand("~/.vim/abbrsout.vim"))
	!python ~/.vim/abbrs2vim.py
endif
source ~/.vim/abbrsout.vim
if filereadable(expand("~/.vim/local.vim"))
	source ~/.vim/local.vim
endif


" Pretty syntax highlighting
syntax on

" Show the line/column positions at the bottom
set ruler

" Display as much as possible of the last line of text
" (instead of displaying an @ character)
set display+=lastline

" Wrapping is annoying
set nowrap

" If wordwrap is on, don't split words across lines
set linebreak

" String to put at the start of lines that have been wrapped
"set showbreak=+
set showbreak=

" Display current mode and partially typed commands
set showmode
set showcmd

" When a bracket is inserted, briefly jump to the matching one (
set showmatch

" Show the filename title in xterms
set title

" Make the autocompletion of filenames,etc behave like bash
set wildmode=longest,list

" Allow splits to have 0 height (use C-W _)
set wmh=0

" Always keep one line of context around the cursor
set scrolloff=1

" Match search results as you type
set incsearch

" Ignore case when searching
set ignorecase

" Ignore the ignorecase character if search contains uppercase chars
set smartcase

" Highlight search terms
set hlsearch

" Mouse options
set mouse=a
set mousehide


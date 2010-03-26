" Keep viminfo
set viminfo=%,'100,\"100,:100,n~/.vim/viminfo

" Vim jumps to the last position when reading a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Keep history
set history=100

" Make a backup (i. e. 'file~') and save it.
set backup
" create ~/.tmp/vimbak if it doesn't exist and use it to save the backups
if has("unix")
	if !isdirectory(expand("~/.tmp/vimbak/."))
		!mkdir -p ~/.tmp/vimbak
	endif
	set backupdir=~/.tmp/vimbak
endif

" Create backups by copying files to backup directory instead of renaming
set backupcopy=yes

" Use modelines
set modelines=5


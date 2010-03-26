" Commenting of lines! Stolen & modified from vim.org's ToggleCommentify
map <C-c> :call ToggleCommentify()<CR>j
imap <C-c> <ESC>:call ToggleCommentify()<CR>j
" The nice thing about these mapping is that you don't have to select a visual
" block to comment ... just keep the CTRL-key pressed down and tap on 'c' as
" often as you need. 

function! ToggleCommentify()
	let lineString = getline(".")
	if strlen(lineString) == 0
		" don't comment empty lines
		return
	endif

	let isCommented = strpart(lineString,0,3)
	let commentSymbol = ''
				
	let commentMapping = {
		\'###': [
			\'conf',
			\'debsources',
			\'exports',
			\'fstab',
			\'make',
			\'mplayerconf',
			\'muttrc',
			\'perl',
			\'procmail',
			\'python',
			\'readline',
			\'ruby',
			\'screen',
			\'sh',
			\'sshconfig',
			\'sudoers',
			\'terminfo',
			\'vrml',
			\'xf86conf',
		\],
\
		\'///': [
			\'c',
			\'cpp',
			\'java',
			\'javascript',
			\'objc',
			\'ox',
			\'php',
		\],
\
		\'"""': [
			\'vim',
		\],
\
		\'!!!': [
			\'xdefaults',
		\],
\
		\'%%%': [
			\'matlab',
			\'tex',
		\],
\
		\'---': [
			\'sql',
		\]
	\}

	for commentChar in keys(commentMapping)
		for name in commentMapping[commentChar]
			if &filetype == name
				let commentSymbol = commentChar
			endif
		endfor
	endfor

	if commentSymbol == ''
		execute 'echo "ToggleCommentify has not (yet) been implemented for the file-type " . &filetype'
	else
		if isCommented == commentSymbol
			" if the line is already commented, uncomment
			call UnCommentify(commentSymbol)
		else
			" if the line is uncommented, comment
			call Commentify(commentSymbol)
		endif
	endif
endfunction

function! Commentify(commentSymbol)
	execute ':s+^+'.a:commentSymbol.'+'
	nohlsearch
endfunction
	
function! UnCommentify(commentSymbol)
	execute ':s+'.a:commentSymbol.'++'
	nohlsearch
endfunction


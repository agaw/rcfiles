" Function key mappings
map <F8> :call ToggleSpelling()<CR>
imap <F8> <C-o>:call ToggleSpelling()<CR>
map <F9> :call InvShow()<CR>
imap <F9> <C-o>:call InvShow()<CR>
map <F10> :call WrapToggle()<CR>
imap <F10> <C-o>:call WrapToggle()<CR>

" Python Calculator
command! -nargs=+ Calc :r! python -c "from math import *; print <args>"

" Unhighlight search results and redraw the screen
nmap <C-l> :nohlsearch<CR>:redraw!<CR>

" Map Y to be consistent with D, C, etc
nmap Y y$

" CTRL-n and CTRL-p to go forwards and backwards through files
nmap <C-n> :next<CR>
nmap <C-p> :prev<CR>

" CTRL-J/K to move up and down, collapsing open windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Press CTRL-z after pasting something to fix up formatting
imap <C-z> <ESC>u:set paste<CR>.:set nopaste<CR>i

" Tab to switch between split windows
nmap <Tab> <C-w><C-w>
nmap <Esc>[Z <C-w>W

" Q to reformat paragraph. I never use ex mode anyway (default binding for Q)
nmap Q gwip


" I frequently type :Q or :WQ, etc instead of :q, :wq
command! WQA :wqa
command! WqA :wqa
command! WQa :wqa
command! Wqa :wqa
command! WA :wa
command! Wa :wa
command! WQ :wq
command! Wq :wq
command! W :w
command! Wn :wn
command! WN :wn
command! Wp :wp
command! WP :wp
command! QA :qa
command! Qa :qa
command! Q :q

" Make the number pad work
map OX =
imap OX =
set t_KC=Op " 0
set t_KD=Oq " 1
set t_KE=Or " 2
set t_KF=Os " 3
set t_KG=Ot " 4
set t_KH=Ou " 5
set t_KI=Ov " 6
set t_KJ=Ow " 7
set t_KK=Ox " 8
set t_KL=Oy " 9

" Toggle wordwrap
function WrapToggle()
	if &wrap
		call WrapOff()
		echo "Word wrap off"
	else
		call WrapOn()
		echo "Word wrap on"
	endif
endfunction

" Turn word wrap off, reset arrows, home, end, etc to default bindings
function WrapOff()
	setlocal nowrap
	" Go up and down by physical linebreaks when not wordwrapped
	iunmap <buffer> <End>
	iunmap <buffer> <Home>
	iunmap <buffer> <Down>
	iunmap <buffer> <Up>
	nunmap <buffer> <Down>
	nunmap <buffer> <Up>
	nunmap <buffer> <End>
	nunmap <buffer> <Home>
	nunmap <buffer> 0
	nunmap <buffer> ^
	nunmap <buffer> $
	vunmap <buffer> <Down>
	vunmap <buffer> <Up>
	vunmap <buffer> <End>
	vunmap <buffer> <Home>
	vunmap <buffer> 0
	vunmap <buffer> ^
	vunmap <buffer> $
	" Allow only backspace & space
	set whichwrap=b,s
endfunction

" Turn word wrapping on and bind arrows, home, end, etc to display lines
function WrapOn()
	setlocal wrap
	" Go up and down by display lines, not linebreaks when wordwrapped
	imap <buffer> <End> <C-o>g$
	imap <buffer> <Home> <C-o>g0
	imap <buffer> <Down> <C-o>gj
	imap <buffer> <Up> <C-o>gk
	nmap <buffer> <Down> gj
	nmap <buffer> <Up> gk
	nmap <buffer> <End> g$
	nmap <buffer> <Home> g0
	nmap <buffer> 0 g0
	nmap <buffer> ^ g^
	nmap <buffer> $ g$
	vmap <buffer> <Down> gj
	vmap <buffer> <Up> gk
	vmap <buffer> <End> g$
	vmap <buffer> <Home> g0
	vmap <buffer> 0 g0
	vmap <buffer> ^ g^
	vmap <buffer> $ g$
	" Allow backspace, space, left/right keys to move across lines
	set whichwrap=b,s,<,>,[,]
endfunction


" Toggle show invisible characters
function InvShow()
	if &list
		echo  "Invisible characters off"
		set nolist
	else
		echo "Invisible characters on"
		set listchars=tab:.\ ,trail:!
		set list
	endif
endfunction


" Spell checking mode toggle
function ToggleSpelling()
	if !exists("s:spell_check") || s:spell_check == 0
		echo  "Spell check on"
		let s:spell_check = 1
		setlocal spell spelllang=en_au
	else
		echo "Spell check off"
		let s:spell_check = 0
		setlocal spell spelllang=
	endif
endfunction


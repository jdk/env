" C
function Filetype_c()
	set autoindent
	set tabstop=8
	set shiftwidth=8
	set noexpandtab
"	set foldnestmax=1
"	set foldmethod=syntax
	set equalprg=indent\ -st
	call ConfigCScope()
	call ReadScriptFiles("~/.vim/scripts/c/*.vim")
	call ReadEnv() " configure any overrides
endfunction

" Make
function Filetype_make()
	set autoindent
	set tabstop=8
	set shiftwidth=8
	set noexpandtab
endfunction

" Javascript
function Filetype_js()
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	set foldmethod=indent
	set foldnestmax=1
	call ReadEnv() " configure any overrides
endfunction

" HTML
function Filetype_html()
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	call ReadEnv() " configure any overrides
endfunction

" VHDL
function Filetype_vhdl()
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
	call ReadEnv() " configure any overrides
endfunction

" Python
function Filetype_python()
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	call ReadEnv() " configure any overrides
endfunction

" TSV
function Filetype_TSV()
	set nowrap
	set noexpandtab
	set tabstop=20
endfunction


" filetype detection handler
if has("autocmd")

	" auto indent on
	filetype plugin indent on

	" highlight 81st character in line
	autocmd BufWinEnter *		call matchadd('ErrorMsg', '\%81v.', -1)

	" C
	autocmd FileType c			call Filetype_c()
	autocmd FileType cpp		call Filetype_c()
	autocmd FileType objc		call Filetype_c()
	autocmd FileType arduino	call Filetype_c()

	" Tab Separated Values
	autocmd BufRead *.tsv		set filetype=tsv
	autocmd FileType tsv		call Filetype_TSV()

	" Javascripts
	autocmd FileType javascript	call Filetype_js()

	" VHDL
	autocmd BufRead *.vhd		set filetype=vhdl
	autocmd FileType vhdl		call Filetype_vhdl()

	" Python
	autocmd Filetype python		call Filetype_python()

	" Make
	autocmd BufRead *.bld		set filetype=make
	autocmd BufRead *.mk		set filetype=make
	autocmd Filetype make		call Filetype_make()

	" HTML
	autocmd Filetype html		call Filetype_html()

endif " has("autocmd")

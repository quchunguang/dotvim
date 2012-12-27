""""""""""""""""""""""""""""""
" Inner Settings
""""""""""""""""""""""""""""""

" pathogen : Manage all plugins in bunder/ MUST BE HERE!
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Common settings
set nocompatible 			" Use Vim settings, rather then Vi settings
set ignorecase 				" Ignore case
set number 				" Show line numbers
set backspace=indent,eol,start 		" Allow backspacing over everything in insert mode
set history=50				" Keep 50 lines of command line history
set ruler				" Show the cursor position all the time
set showcmd				" Display incomplete commands
set incsearch				" Do incremental searching

" Backup file
set backup
set backupext=~
set backupdir=/tmp

" Encoding
let &termencoding=&encoding
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,shift-jis,cp936,gb18030,big5,euc-kr,latin1
set fileformats=unix
set encoding=utf-8
set langmenu=zh_CN.UTF-8

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
if has("autocmd")
	filetype plugin indent on
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
augroup END

" Build-in make
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr> 
autocmd FileType c,cc map <buffer> <F5> :w<cr>:make<cr>

nnoremap <silent> <F11> :Grep<CR>

" User qcg custom commands
nmap <leader>ti :read !date +'\%Y-\%m-\%d \%H:\%M'<cr>A<space>
nmap <leader>da I<C-R>=strftime("[%Y-%m-%d] ")<cr><esc>O<esc>jo<esc>80i=<esc>o
nmap <leader>ba O```bash<esc>jo```<esc>kA
nmap <leader>py O```python<esc>jo```<esc>kA
nmap <leader>si Go<esc>:read !cat ~/.signature<cr>gg
nmap <leader>si2 Go<esc>:read !cat ~/.signature2<cr>gg

""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one
nmap <C-Space><C-Space>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'	" Location of ctags
let Tlist_Show_One_File = 1		" Show only one file's taglist
let Tlist_Exit_OnlyWindow = 1		" If taglist window is the only window, exit vim
let Tlist_Use_Right_Window = 1 		" Show taglist window at right side
map <silent> <F8> :TlistToggle<cr> 

""""""""""""""""""""""""""""""
" winManager
" with FileExplorer & TagList
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
map <silent> <F9> :Sexplore!<cr> 

""""""""""""""""""""""""""""""
" A : switch between c/h file
""""""""""""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0 		" Do not show default help.
let g:bufExplorerShowRelativePath=1 	" Show relative paths.
let g:bufExplorerSortBy='mru' 		" Sort by most recently used.
let g:bufExplorerSplitRight=0 		" Split left.
let g:bufExplorerSplitVertical=1 	" Split vertically.
let g:bufExplorerSplitVertSize = 30 	" Split width
let g:bufExplorerUseCurrentWindow=1 	" Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 
map <silent> <F6> \bv

""""""""""""""""""""""""""""""
" LookupFile
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2       " At lease two charactors for finding
let g:LookupFile_PreserveLastPattern = 0        " Donot save finding string before
let g:LookupFile_PreservePatternHistory = 1     " Save finding history
let g:LookupFile_AlwaysAcceptFirst = 1 	" Open first match when return
let g:LookupFile_AllowNewFiles = 0 	" Donot create file if not exist

" Set file of tags
if filereadable("filenametags")
	let g:LookupFile_TagExpr = '"filenametags"'
endif

nmap <silent> <leader>lk <Plug>LookupFile<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

" Lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception |
		echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry

	" Show the matches for what is typed so far
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 

"""""""""""""""""""
" complete mapping
"""""""""""""""""""
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L> 

""""""""""""""""""""""""""""""
" supertab setting
""""""""""""""""""""""""""""""
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabMappingForward = '<c-T>'		" change <tab> to <c-T>
let g:SuperTabMappingBackward = '<s-c-T>'	" change <s-tab> to <s-c-T>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

""""""""""""""""""""""""""""""
" mark setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

""""""""""""""""""""""""""""""
" MarksBrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr>

""""""""""""""""""""""""""""""
" Man page 
" Usage: :Man ls
""""""""""""""""""""""""""""""
source $VIMRUNTIME/ftplugin/man.vim

""""""""""""""""""""""""""""""
" OmniCppComplete
""""""""""""""""""""""""""""""
" optional: auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

let OmniCpp_MayCompleteDot = 1 		" autocomplete with .
let OmniCpp_MayCompleteArrow = 1 	" autocomplete with ->
let OmniCpp_MayCompleteScope = 1 	" autocomplete with ::
let OmniCpp_SelectFirstItem = 2 	" select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 	" search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 	" show function prototype (i.e. parameters) in popup window

""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""
" generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" set tags to normal use folder
if filereadable("tags")
	set tags=tags
endif
set tags+=~/.vim/tags_gcc_4.4.3

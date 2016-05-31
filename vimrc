
" Use Vim settings, rather then Vi settings.
set nocompatible

let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin manager
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusline - retired by lightline

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif
"let g:airline#extensions#tabline#enabled = 1

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"let g:airline#extensions#tabline#left_sep = '⮀'
"let g:airline#extensions#tabline#left_alt_sep = '⮁'

" prepatched fonts with new powerline font codes
"Plugin 'Lokaltog/powerline-fonts'
"let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"updates ctags when saving files
Plugin 'vim-scripts/AutoTag'  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use :BD to delete buffer without killing window
Plugin 'vim-scripts/bufkill.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file finder -  replaced by unite
"Plugin 'vim-scripts/FuzzyFinder'

"nmap <leader>f :FufFileWithCurrentBufferDir<CR>
"nmap <leader>b :FufBuffer<CR>
"nmap <leader>f :FufTaggedFile<CR>
"nmap <leader>t :FufTag<CR>
"nmap <leader>l :FufLine<CR>

"noremap <silent> <C-]> :FufTagWithCursorWord!<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" library used by other plugins
Plugin 'vim-scripts/L9'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" target highlighted motion - using <leader><leader> w|f|t
Plugin 'Lokaltog/vim-easymotion'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-complete - successor of neocomplcache
Plugin 'Shougo/neocomplete'
" snippets engine - alterantive to snipmate, ultisnips, xptemplate
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" enable neocomplete
let g:neocomplete#enable_at_startup = 1

" Enable neosnippet's snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
	\ }
 
" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
"
" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
"   endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file explorer
Plugin 'Shougo/vimfiler.vim'
nmap <leader>o :VimFilerExplorer <CR>
" show certain hidden files
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" helps commenting out selection
Plugin 'scrooloose/nerdcommenter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file explorer with tab support - replaced by vimfiler
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"nmap <leader>o :NERDTreeTabsToggle<CR>
let g:NERDTreeDirArrows=0
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" checks programming syntax with external checkers on demand or save
Plugin 'scrooloose/syntastic'

"obsolete since ensime-vim integrates scalastyle checking
"let g:syntastic_scala_checkers=['scalac', 'scalastyle']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-optimized meaningful line numbers
Plugin 'myusuf3/numbers.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting for robotframework files
" Plugin 'mfukar/robotframework-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags pane
Plugin 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" use local ctags instead of one in /usr/bin/ 
let g:tagbar_ctags_bin="ctags"

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
    \ 'p:packages',
    \ 'T:types:1',
    \ 't:traits',
    \ 'o:objects',
    \ 'O:case objects',
    \ 'c:classes',
    \ 'C:case classes',
    \ 'm:methods',
    \ 'V:values:1',
    \ 'v:variables:1'
    \ ]
\ }
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" generates quickfix file based on scala - requires installing sbt plugin
" <leader>ff  and <leader>fn
Plugin 'dscleaver/sbt-quickfix'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" adds various scala related add-ons
Plugin 'derekwyatt/vim-scala'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scalariform support - plugin corrupt, so install scalariform locally and use directly
" Plugin 'rompetroll/vim-scalariform'
au BufEnter *.scala setl formatprg=scalariform\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" session management using :SaveSession and :OpenSession
Plugin 'xolox/vim-misc' 
Plugin 'xolox/vim-session'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change surround using cs'" to change ' to "
Plugin 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" next/prev bindings
Plugin 'tpope/vim-unimpaired'

nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab completetion
Plugin 'ervandew/supertab'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" True Sublime Text style multiple selections
Plugin 'terryma/vim-multiple-cursors'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusline
Plugin 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
 			\ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return "-"
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.scala call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visualizes undo tree
Plugin 'sjl/gundo.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use :Tab /foo to tabularize
Plugin 'godlygeek/tabular'

if exists(":Tabularize")
	nmap <Leader>ta= :Tabularize /=<CR>
	vmap <Leader>ta= :Tabularize /=<CR>
	nmap <Leader>ta: :Tabularize /:\zs<CR>
	vmap <Leader>ta: :Tabularize /:\zs<CR>
endif

" align at | as we type - taken from https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown support
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" access history of yanks
" Plugin 'vim-scripts/YankRing.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <ctrl-w>o to toggle full screen 
Plugin 'vim-scripts/ZoomWin'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quiksilver style search
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc'
Plugin 'tsukkee/unite-tag'
"nnoremap <Nul> :Unite -start-insert buffer file_rec/async<CR>
nnoremap <Nul> :Unite -start-insert -ignorecase -smartcase buffer file_rec/git<CR>
"nnoremap <c-@> :Unite -start-insert buffer file_rec<CR> 
"nnoremap <c-Space> :Unite -start-insert buffer file_rec<CR> 
" -auto-preview
"nnoremap <TODO> :Unite -start-insert tags<CR>
"nnoremap <TODO> :Unite -start-insert outline<CR>
"nnoremap <TODO> :Unite -start-insert sn<CR>
"nnoremap <TODO> :Unite -start-insert sn_search<CR>
"nnoremap <TODO> :Unite -start-insert sn_tag<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '.*project.*\|.*target.*\|.*cache.*')
call unite#custom#profile('custom', 'context.ignorecase', 1)

"not working?
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" Overwrite settings.
	imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simplenote related - currently no working solution avaialable
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/vim-metarw'
"Plugin 'mattn/vim-metarw-simplenote'
"Plugin 'mattn/vimplenote-vim'
"Plugin 'mattn/unite-source-simplenote'
"Plugin 'takei-shg/vim-metarw-simplenote'
""Plugin 'takei-shg/unite-source-simplenote'

" simplenote access using unite and metarw
"Plugin 'sorah/metarw-simplenote.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git integration
Plugin 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git integration
Plugin 'airblade/vim-gitgutter'
set updatetime=250

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json syntax higlighting
Plugin 'elzr/vim-json'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ansible syntax highlighting
Plugin 'chase/vim-ansible-yaml'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" docker support
Plugin 'ekalinin/Dockerfile.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert mode auto-completion for quotes, parens, brackets
Plugin 'Raimondi/delimitMate'
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scala ensime
Plugin 'ensime/ensime-vim'
autocmd BufWritePost *.scala :EnTypeCheck
nnoremap <leader>t :EnTypeCheck<CR>
au FileType scala nnoremap <leader>df :EnDeclarationSplit v<CR>
au FileType scala nnoremap <leader>db :EnDocBrowse<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" camel case movements
Plugin 'vim-scripts/camelcasemotion'

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color schemes
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux theme integration
Plugin 'edkolev/tmuxline.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom dev icon integration
" must load after NERDTree, vim-airline, CtrlP, powerline, unite, vimfiler, flagship 
Plugin 'ryanoasis/vim-devicons'
set guifont=Lucida\ Console\ for\ Powerline\ Nerd\ Font\ Complete.ttf:h11

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" clipboard integration with mac osx iterm2
"set clipboard=unnamed,autoindent
if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard

	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif

" paste mode to avoid autoformatting
set pastetoggle=<F2>
 
" allow unsaved buffers in hidden windows
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=500		" keep x lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set showmode " show editor mode
set scrolloff=4 " When the page starts to scroll, keep the cursor x lines from the top and the bottom
set virtualedit=all " Allow the cursor to go in to "invalid" places

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse-=a
endif

" enable 256 colors
set t_Co=256
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' 
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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" toggle search results
nmap <leader>s :set hlsearch!<CR>

" navigate errors
nmap <leader>J :cn<CR>
nmap <leader>K :cp<CR>
nmap <leader>Q :cw<CR>

nmap <leader>j :lne<CR>
nmap <leader>k :lp<CR>
nmap <leader>q :lw<CR>

nmap <leader>n :ta<CR>
nmap <leader>p :po<CR>

" reload vim config
nmap <leader>r :so $MYVIMRC<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:.\ ,eol:¬
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" good 256color schemes: lucius, xoria256, jellybeans,
" other 256color schemes: gardener, desert256, inkpot, wombat256, zenburn
colorscheme jellybeans

set autoread

" show line numbers
set nu

" disable line wrapping
set nowrap

set backupdir=~/.vim/backup
set directory=~/.vim/backup

if has("gui_running")
    set guioptions=-t
endif

" Bubble single lines
"nmap <C-Up> ddkP
"nmap <C-Down> ddp
" Bubble multiple lines
"vmap <C-Up> xkP`[V`]
"vmap <C-Down> xp`[V`]

" use tab key to exit insert mode
" nnoremap <Tab> <Esc>
" vnoremap <Tab> <Esc>gV
" onoremap <Tab> <Esc>
" inoremap <Tab> <Esc>`^
" inoremap <Leader><Tab> <Tab>

" tab navigation like firefox
" won't work with putty though due to putty not sending ctrl-tab
" nmap <S-h> :tabprevious<CR>
" nmap <S-l> :tabnext<CR>
" map <C-S-tab> :tabprevious<CR>
" map <C-tab> :tabnext<CR>
" imap <C-S-tab> <Esc>:tabprevious<CR>i
" imap <C-tab> <Esc>:tabnext<CR>i
" nmap <C-t> :tabnew<CR>
" imap <C-t> <Esc>:tabnew<CR>
" nmap <C-w> :tabclose<CR>
" imap <C-w> <Esc>:tabclose<CR>

" map ctrl-tab
nmap [27;5;9~ :bnext<CR>
nmap [27;6;9~ :bprev<CR>
"nmap <C-Tab> :bnext<CR>
"nmap <C-S-Tab> :bnext<CR>

" screen scrolling
map <c-j> <c-e>
map <c-k> <c-y>

" erlang integration
"let g:erlang_highlight_bif = 1
"let g:erlang_complete_file="~/.vim/bundle/vimerl/autoload/erlang_complete.erl"
"let g:erlangCheckFile="~/.vim/bundle/jimenezrick-vimerl/compiler/erlang_check.erl"
"let erlang_check_file="~/.vim/bundle/vimerl/compiler/erlang_check.erl"
"let g:erlang_man_path="/usr/local/lib/erlang/man"	 
"let erlang_show_errors=1

set encoding=utf-8
set laststatus=2

autocmd FileType scala set textwidth=72
if v:version >= 703
	set colorcolumn=+1
endif
hi ColorColumn guibg=#2d2d2d ctermbg=235
 
let g:session_autosave = 'no'



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
" updates ctags when saving files - retired by sbt-ctags
"Plugin 'vim-scripts/AutoTag'  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use :BD to delete buffer without killing window
Plugin 'vim-scripts/bufkill.vim'
nmap <leader>qq :BD <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file finder -  replaced by unite
"Plugin 'vim-scripts/FuzzyFinder'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utility library used by other plugins
Plugin 'vim-scripts/L9'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" target highlighted motion - using <leader> w|f|t|b
Plugin 'Lokaltog/vim-easymotion'

map <Leader> <Plug>(easymotion-prefix)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-complete - successor of neocomplcache - also replaced supertab
"Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete'

let g:neocomplete#enable_at_startup = 1

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
	\ }
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets engine - alterantive to snipmate, ultisnips, xptemplate
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" Enable neosnippet's snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

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

nmap <leader>x :VimFilerExplorer <CR>
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
" vim-optimized meaningful line numbers relative to cursor
Plugin 'myusuf3/numbers.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags pane
Plugin 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>

let g:tagbar_ctags_bin="ctags" " use local ctags instead of one in /usr/bin/  

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
" generates quickfix file based on scala - requires installing sbt plugin -
" retired by vim-ensime
"Plugin 'dscleaver/sbt-quickfix'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" adds various scala related add-ons like tagbar plugin type definition for scala
Plugin 'derekwyatt/vim-scala'
nnoremap <leader>oi :SortScalaImports<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scalariform support - plugin corrupt, so install scalariform locally and use directly
" Plugin 'rompetroll/vim-scalariform'
"au BufEnter *.scala setl formatprg=scalariform\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" session management using :SaveSession and :OpenSession
Plugin 'xolox/vim-misc' 
Plugin 'xolox/vim-session'

let g:session_autosave = 'no'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change surround like cs'" to change ' to "
Plugin 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" next/prev bindings to [ and ] 
Plugin 'tpope/vim-unimpaired'

" rebind to < and >
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sublime text style multiple selections with C-n
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
" undo tree
"Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
nnoremap <leader>ut :UndotreeToggle<CR> 

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
" access history of yanks with <C-n> and <C-p> after paste
 Plugin 'vim-scripts/YankRing.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-w>o to toggle full screen 
Plugin 'regedarek/ZoomWin'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quiksilver style search
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc'
Plugin 'tsukkee/unite-tag'
Plugin 'sgur/unite-qf'
Plugin 'lambdalisue/unite-grep-vcs'

" <C-Space> works mapping <c-@> or <Nul> depending on terminal
" -auto-preview to open additional preview pane - too slow however
nnoremap <Nul> :Unite -start-insert -ignorecase -smartcase file_rec/git<CR>
nnoremap <leader>qf :<C-u>Unite -start-insert -ignorecase -smartcase qf:enc=utf-8 -no-quit<CR> 
nnoremap <leader>bf :<C-u>Unite -start-insert -ignorecase -smartcase buffer<CR> 
nnoremap <leader>gg :<C-u>Unite -start-insert -ignorecase -smartcase grep/git:.<CR> 
nnoremap <leader>ol :<C-u>Unite -start-insert -ignorecase -smartcase outline<CR> 
nnoremap <leader>ts :<C-u>Unite -start-insert -ignorecase -smartcase tag<CR> 
nnoremap <leader>ag :<C-u>Unite -start-insert -ignorecase -smartcase file_rec/async<CR> 
"nnoremap <leader>ag :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <leader>ag :<C-u>Unite -start-insert -ignorecase -smartcase grep:. -buffer-name=search-buffer<CR><C-R><C-W>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '.*project.*\|.*target.*\|.*cache.*')
call unite#custom#profile('custom', 'context.ignorecase', 1)

function! s:unite_my_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Overwrite settings.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
  imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
  "imap <buffer> <esc> <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  nmap <buffer> <C-j> <plug>(unite_toggle_auto_preview)
  imap <buffer> <TAB> <plug>(unite_select_next_line)
  imap <buffer> <S-TAB> <plug>(unite_select_previous_line)
endfunction

augroup unite
  au! 
  autocmd FileType unite call s:unite_my_settings()
augroup END

" replace find with ag if available
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

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
 
"nnoremap <TODO> :Unite -start-insert sn<CR>
"nnoremap <TODO> :Unite -start-insert sn_search<CR>
"nnoremap <TODO> :Unite -start-insert sn_tag<CR>
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git integration
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
 
augroup fugitive
  au! 
  " map .. to go back to go to parent tree
  autocmd User fugitive 
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
  " auto-close hidden buffers used for browsing git objects
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git integration - shows git flags next to line numbers
Plugin 'airblade/vim-gitgutter'
set updatetime=250

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax higlighting
Plugin 'sheerun/vim-polyglot'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert mode auto-completion for quotes, parens, brackets
"Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scala ensime
Plugin 'ensime/ensime-vim'
autocmd BufWritePost *.scala :EnTypeCheck
nnoremap <leader>tc :EnTypeCheck<CR>
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
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'noahfrederick/vim-hemisu'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux theme integration with lightline
Plugin 'edkolev/tmuxline.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux pane navigation
Plugin 'christoomey/vim-tmux-navigator'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom dev icon integration
" must load after NERDTree, vim-airline, CtrlP, powerline, unite, vimfiler, flagship 
Plugin 'ryanoasis/vim-devicons'
set guifont=Literation\ Mono\ Powerline\ Nerd\ Font\ Complete.ttf:h11

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" clipboard integration with mac osx iterm2
if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard
	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif
 
if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
 
if has('mouse')
  set mouse=a
endif
 
set pastetoggle=<F2> " toggle paste mode to avoid autoformatting 
set hidden " allow unsaved buffers in hidden windows 
set backspace=indent,eol,start " allow backspacing over everything in insert mode 
set history=500		" keep x lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set showmode " show editor mode
set scrolloff=4 " When the page starts to scroll, keep the cursor x lines from the top and the bottom
set virtualedit=all " Allow the cursor to go in to "invalid" places
set encoding=utf-8
set laststatus=2 " always display statusline 
set listchars=tab:.\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs 
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
set autoread " automatically reload changed files if they have not been edited
set nu " show line numbers 
set nowrap " disable line wrapping 
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set hlsearch "highlight search results
set colorcolumn=+1 " color columns beyond textwidth 
set autoindent		" always set autoindenting on
 
" good 256color schemes: lucius, xoria256, jellybeans,
" other 256color schemes: gardener, desert256, inkpot, wombat256, zenburn
colorscheme jellybeans
 
" color overrides
highlight ColorColumn guibg=#2d2d2d ctermbg=235
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

filetype plugin indent on "enable filetype detection, plugin and indent
syntax on "switch on syntax highlighting

augroup vimrcEx
  au! 
  autocmd FileType scala set textwidth=72
  autocmd FileType text setlocal textwidth=78
 
  " When opening a file, jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" toggle `set list` to show/hide special characters
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


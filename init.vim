" Vim Plug {{{
set number
"if empty(glob('~/.nvim/autoload/plug.vim'))
   "silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
        "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
call plug#begin()

"Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'poppyschmo/deoplete-latex'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
"Plug 'tomasr/molokai'
Plug 'julialang/julia-vim'
"Plug 'zyedidia/julialint.vim'
"Plug 'shougo/neocomplete.vim'
Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'valloric/youcompleteme'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'baruchel/vim-notebook'
"Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'ervandew/supertab'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
" }}}

set background=dark
colorscheme PaperColor
"wombat256mod " 256mod work with terminal
"set tabstop=4       " number of visual spaces per TAB
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
"set softtabstop=0   " number of spaces in tab when editing
"set expandtab       " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set linebreak
set breakindent
set breakindentopt=shift:4

"runtime macros/matchit.vim
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap gj <Down>
nnoremap gk <Up>
" highlight last inserted text
nnoremap gV `[v`]
" Leader
let mapleader="\\"

nnoremap init :tabe $MYVIMRC<CR>

" jk is escape
inoremap jk <esc>

" toggle gundo
"nnoremap <leader>u :GundoToggle<CR>

" More natural moving around
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" deopelte settings {{{
let g:deoplete#enable_at_startup=1
" }}}

" Adjust font based on system {{{
set number
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Inconsolata\ for\ Powerline:h16
    "set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Inconsolata\ for\ Powerline:h12
  endif
endif
" }}}

" CtrlP settings {{{
set number
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'r'
"make CtrlP default mixed search
nnoremap <C-P> :CtrlPMixed<CR>
" }}}

"" Airline {{{
"set number
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
" unicode symbols

set encoding=utf-8

"" }}}

" Window size {{{
set number
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  "if exists("+lines")
    "set lines=50
  "endif
  "if exists("+columns")
    "set columns=100
  "endif
endif
" }}}

" Fold {{{
set number
set modelines=1
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=marker   " fold based on indent level
set foldlevel=0

"}}}


" Notebook Setting (Julia) {{{
set number
nnoremap <leader>jj ::NotebookEvaluate<CR>
let g:notebook_cmd='~/julia/bin/julia'
let g:notebook_stop='exit()'
let g:notebook_send0=""
let g:notebook_send='println(); println(\"VIMJULIANOTEBOOK\")'
let g:notebook_detect='VIMJULIANOTEBOOK'
"}}}

" syntax highlighting for Markdown files {{{
set number
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'julia']
"}}}

" deoplete moving and selecting {{{
set number
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}

" UltiSnips {{{
set number
let g:UltiSnipsExpandTrigger = "<C-Y>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsSnippetsDir = "~/.vim/mySnippets"
"}}}

"autocmd BufNewFile,BufRead *.tex :VimtexTocOpen
autocmd Filetype tex :VimtexTocOpen
"""" The following line MUST be at the last line for the folding to work.

"" Faster saving and add to git {{{
nnoremap ww :w<CR>
nnoremap wq :wq<CR>
nnoremap gw :Gw<CR>
nnoremap gc :Gcommit<CR>
nnoremap gp :Gpush<CR>
"}}}

"" Removing Trailing white spaces
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" DelimitMate {{{
let delimitMate_expand_space=1
let delimitMate_expand_cr = 1
let delimitMate_expand_inside_quotes = 1
let b:delimitMate_quotes = "$" "\" ' `"
imap <C-L> <Plug>delimitMateS-Tab
"imap <Space><Space> <Space><Left>
" vim:foldmethod=marker:foldlevel=0
set omnifunc=syntaxcomplete#Complete
"}}}

" moving left in insert mode
imap <C-H> <Left>

" Vimtex + deoplete {{{
set number
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
    \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
    \ .')'
"}}}

"Vimtex + neocomplete (inactive) {{{
set number
"if !exists('g:neocomplete#sources#omni#input_patterns')
"let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.tex =
    "\ '\v\\%('
    "\ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    "\ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
    "\ . '|hyperref\s*\[[^]]*'
    "\ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    "\ . '|%(include%(only)?|input)\s*\{[^}]*'
    "\ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    "\ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
    "\ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
    "\ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
    "\ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
    "\ . ')'
"}}}

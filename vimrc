"" ====== General =======
"Get out of VI's compatible mode..
set nocp

"Sets how many lines of history VIM har to remember
set history=500

"Enable filetype plugin. Required for latex.
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread


"Select all and copy to + buffer
map sa :%y +


" Nice window title
set title
set titlestring+=%f\                     " file name
set titlestring+=%h%m%r%w                " flags
set titlestring+=\ -\ %{v:progname}      " program name

"restore your cursor position in a file over several editing sessions.
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"" ====== Colors and Fonts =======
"By far my favourite
colorscheme zenburn 

"Enable syntax hl
syntax enable

"Set bg to dark
"set background=dark

"Font type and size
"set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
"set guifont=Terminus\ 8
set guifont=Monospace\ 10

"set Pattern matching highlight
hi MatchParen guifg=#000000 guibg=#D0D090

if has("gui_running")
    set guioptions-=T
endif

" ============ User interface ========
"When moving vertical, start scrolling 7 lines before reaching the extremity"{{{
set so=7


" Always show current position
set ruler

"The commandbar is 1 line high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Ignore case when searching
set ignorecase

"You will see results while you type
set incsearch

"Set magic on
set magic
"Use abreviation in the messages (like + instead of Modified)

set shortmess=at

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=12

"Highlight search things
set hlsearch

" Show partial commands
set showcmd

" ========= Status Line =================
"Use statusline in every window
set laststatus=2

"Format the statusline
"set statusline+=\ File:\%F%m%r%h\ %w\ \ \ Current\ dir:\%r%{getcwd()}%h

set highlight=si

" =========== Other shortcuts ===========
"Indent all lines
"map ia mzggVG='z

"Switch to current dir
map CD :cd %:p:h

"Select all and copy to + buffer
map sa :%y +

" Buffer - "hide" :hide)
"map  mzggVGg?'z

"Explore Fast
map ee :Explore 

"Paste toggle - when pasting something in, don't indent.
"set pastetoggle=

"Quit fast
map q :qa 

" if using a version 6 vim, enable folding
if version >= 600
    set foldenable
endif

" ========= Text Options ========
"In Insert mode: Use the appropriate number of spaces to insert a 
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" ========== File options =======
"Turn backup off
set nobackup

"Don't create a backup when overwriting a file
set nowb

set noswapfile
set noar

" ========= Indent ==============
"Auto indent
set ai
"Smart indet
set si
"C-style indeting
set cindent
"Wrap lines
set wrap

" Set format options
set textwidth=70
set formatoptions=crqn

" Set more shortcuts
" This one is to [surround current word with [] and add a [prefix of []
" and position the cursor at [word][_] _.
map ml bi[<Esc>ea][]<Esc>i

" for some reason, some included file causes compatibility to be
" called, this is the only thing that makes vim see sense.
set nocp

set clipboard=unnamed

" Tabularize shortcuts
vmap t: :Tabularize /:<return>
vmap t= :Tabularize /=<return>

" javascript folding
function! JavaScriptFold() 
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction

  setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

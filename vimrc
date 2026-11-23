" Based on http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi

"" Pathogen
execute pathogen#infect()

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" keys
let mapleader = ","

"set visualbell
set wrap linebreak nolist
set textwidth=0
set wrapmargin=0
set number

"" Whitespace
set tabstop=4 shiftwidth=4
set expandtab                   " use spaces, not tabs
set softtabstop=4               " unify
set backspace=indent,eol,start  " backspace through everything in insert mode
" Use better-whitespace to auto trim trailing whitespace on save
autocmd FileType * autocmd BufWritePre <buffer> StripWhitespace

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Colours
if has('gui_running')
    set background=light
else
    set background=dark
endif
if has('termguicolors') && $COLORTERM ==# 'truecolor'
    " True-color terminal
    set termguicolors
else
    " set notermguicolors is the default
    let g:solarized_use16 = 1  " If you want to use ANSI colors
    "set t_Co=256
    "let g:solarized_termcolors=256
endif
colorscheme solarized8
if !has('nvim')
    set guifont=Source\ Code\ Pro:h12
endif

" vim-powerline
set laststatus=2

"let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
"let g:netrw_list_hide='.pyc$'
set wildignore=.DS_Store,*.pyc,__pycache__,venv

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

set rtp+=/opt/local/share/fzf/vim

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" Swift
let g:syntastic_aggregate_errors = 1
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint', 'swiftc', 'swift'] "", 'syntastic-swift']

" Based on http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi

"" Pathogen
execute pathogen#infect()

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set wrap linebreak nolist
set textwidth=0
set wrapmargin=0
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
colorscheme solarized
set guifont=Source\ Code\ Pro:h12

" vim-powerline
set laststatus=2

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

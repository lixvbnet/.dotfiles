set history=100         " 100 history
set ruler               " show the cursor position
set lazyredraw          " Don't redraw while executing macros (good performance config)
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing

filetype plugin on      " use the file type plugin
filetype indent on

"set expandtab           " Convert Tab to spaces
set smarttab            " Be smart when using Tabs
set ts=4                " Tab Stop
set shiftwidth=4        " The width of a Tab

set ai                  " auto indenting
set si                  " smart indenting

syntax on               " syntax on

set hlsearch            " highlight the last searched term
set incsearch           " make search act like search in modern browsers
set ignorecase          " Ignore case when searching
set smartcase           " Try to be smart about cases when searching

set magic               " For regular expressions turn magic on
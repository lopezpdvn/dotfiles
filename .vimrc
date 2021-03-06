" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode,  <BS>, <Del>,
" CTRL-W and CTRL-U can be used in insert mode to backspace.
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Display incomplete commands, and the size of the selected area in Visual
" mode in the last line of the screen.
set showcmd

" While typing a search command, show where the pattern, as it was typed so
" far, matches.  The matched string is highlighted.
set incsearch

if has('mouse')
  set mouse=a
endif

" Mouse pointer is hidden when characters are typed, and restored when the
" mouse is moved.
set mousehide

" Switch syntax highlighting on, when the terminal has colors or when running
" the gui.  Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

if has("autocmd")
  filetype plugin indent on

  " TODO: Put these in an autocmd group, so that we can delete them easily.
  "augroup vimrcEx
  "au!
      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      " Also don't do it when the mark is in the first line, that is the default
      " position when opening a file.
      "autocmd BufReadPost *
        "\ if line("'\"") > 1 && line("'\"") <= line("$") |
        "\   exe "normal! g`\"" |
        "\ endif

  "augroup END
endif

" Indentation and tab configuration -------------------------------------------
" In 'tabstop' option help entry, 4 main ways to use tabs in Vim are
" described.  This options set way 2:  set 'tabstop' and 'shiftwidth' to
" whatever value and use 'expandtab'.  This way space will always be inserted.
" The formatting will never be messed up when 'tabstop' is changed.
set autoindent

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.

" Number of spaces to use for each step of (auto)indent.  Used for 'cindent',
" >>, <<, etc.
set shiftwidth=2

" In Insert mode: use the appropiate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands.  Note: to insert a
" real tab, use CTRL-V<Tab>.
set expandtab

" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>.  It 'feels' like <Tab>s are being
" inserted, while in fact only spaces are used (because of 'expandtab' option
" is set, see below).
set softtabstop=2

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' or 'softtabstop' is used in other places.  A <BS> will delete a
" 'shiftwidth' worth of space at the start of the line.
set smarttab
" ----------------------------------------------------------------------

set wildmenu
set wildmode=longest:full,full
set wildignore+=*~

set background=dark

set ignorecase
set smartcase

set showmatch

" Abbreviations
iabbrev teh the
iabbrev otor otro
iabbrev PILH Pedro Iván López Hernández
iabbrev indnent indent
iabbrev corot corto

" ----------------------------------------------------------------------------- 
" Include options to influence how Vim formats text.  Default is 'tcq':
"   - t :   Auto-wrap text using textwidth.
"   - c :   Auto-wrap comments using textwidth, inserting the current comment
"           leader automatically.
"   - q :   Allow formatting of comments with 'gq'.
" The following options are added:
"   - r :   Automatically insert the current comment leader after hitting
"           <Enter> in Insert mode.
"   - o :   Automaticalyy insert the current comment leader after hitting 'o'
"           or 'O' in Normal mode.
"   - n :   When formatting text, recognize numbered lists.  Use
"           'formatlistpat' option.
set formatoptions+=r,o,n

" Set filetypes by file extension
au BufNewFile,BufRead *.md set filetype=markdown

" Set the previous context mark, find 1 or more consecutive spaces until the
" end of the line and remove them.  When the search pattern fails, do not issue
" an error message and, in particular, continue in maps as if no erro occurred.
" Then return to the context mark.
map ri m`:%s/\s\+$//e<CR>``

execute pathogen#infect()

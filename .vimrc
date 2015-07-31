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

execute pathogen#infect()


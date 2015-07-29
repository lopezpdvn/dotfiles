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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Mouse pointer is hidden when characters are typed, and restored when the
" mouse is moved.
set mousehide


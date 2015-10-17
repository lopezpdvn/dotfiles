set cmdheight=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Only do this for Vim version 5.0 and later.
if version >= 500
  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " For Win32 version, have "K" lookup the keyword in a help file
  if has("win32")
    let winhelpfile='windows.hlp'
    map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  endif
endif

set guioptions+=aci
set guioptions-=e
set guioptions-=m
set guioptions-=g
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L

set guifont=Monospace\ 14

" non-GUI colorscheme may be different.
colorscheme brookstream  

" Hack to set bold some words without affecting last colorscheme loaded.
colorscheme cshack          

" Highlight the screen column of the cursor with CursorColum.
set cursorcolumn

" Highlight the screen line of the with CursonLine.
set cursorline

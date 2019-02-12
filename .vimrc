" .vimrc linux version d.d. 02-09-2017
"  vim 8.0.964 on OpenSuse Linux 42.3

" Autoload vimplug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

  "Plug ' put plugin here'

" Initialize plugin system
call plug#end()

"Basic settings
  set nocompatible
  set number
  set relativenumber
  set nowrap
  set sidescroll=5
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set expandtab
  set shiftround
  set cursorline
  set colorcolumn=90
  set laststatus=2
  set statusline=%F\ %r%m\ %=(%l/%L,%c)\ B%n
  set history=200
  set undolevels=100
  set autoindent
  set smartindent
  set hlsearch
  set incsearch
  set hidden
  set backspace=indent,eol,start
  set fileencoding=utf8
  set encoding=utf-8
  set showmatch
  set visualbell
  set path+=**
  set wildmenu
  set wildmode=full
  set nowrapscan
  set showcmd
  set scrolloff=5

"Syntax highlighting
  filetype on
  filetype indent on
  filetype plugin on
  syntax enable
  syntax on

"Color settings
  colorscheme wombat256mod
  highlight comment ctermfg=4 guifg=#626262
  highlight ColorColumn ctermbg=233 guibg=#404040

"Key mappings
  let mapleader = ','
  nnoremap \ ,

  "Hide or show comments
  nnoremap <Leader>h :highlight Comment ctermfg=4 guifg=#626262<CR>
  nnoremap <Leader>s :highlight Comment ctermfg=10 guifg=Green<CR>

  "Comment-out SAS code
  cnoremap <Leader>c s/\(.*\S\)\s*/\/\*\1\*\//<bar>nohl<CR>
  nnoremap <Leader>c :s/\(.*\S\)\s*/\/\*\1\*\//<bar>nohl<CR>
  vnoremap <Leader>c :s/\(.*\S\)\s*/\/\*\1\*\//<bar>nohl<CR>

  "Comment-out SAS code
  cnoremap <Leader>u s/\/\*\(.*\S\)\s*\*\//\1/<bar>nohl<CR>
  nnoremap <Leader>u :s/\/\*\(.*\S\)\s*\*\//\1/<bar>nohl<CR>
  vnoremap <Leader>u :s/\/\*\(.*\S\)\s*\*\//\1/<bar>nohl<CR>

  "Reapeatable in- and outdenting of blocks
  vnoremap > >gv
  vnoremap < <gv

  "Practical escape out of insert mode.
  inoremap jk <esc>

  "Make regex searches case sensitive and more perl compatible
  nnoremap / /\C\v
  nnoremap ? ?\C\v

  "swith off search highlight
  nnoremap <Leader>o :nohl<CR>

  "Strict mode.
  nnoremap <up>       <nop>
  nnoremap <down>     <nop>
  nnoremap <left>     <nop>
  nnoremap <right>    <nop>
  inoremap <up>       <nop>
  inoremap <down>     <nop>
  inoremap <left>     <nop>
  inoremap <right>    <nop>
  nnoremap <pageup>   <nop>
  nnoremap <pagedown> <nop>

" map escape to pressing jk at the same time (thanks touchbar)
  inoremap jk <Esc>
  inoremap kj <Esc>
  vnoremap jk <Esc>
  vnoremap kj <Esc>

"File browser settings
  let g:netrw_banner=0
  let g:netrw_browse_split=2
  let g:netrw_liststyle=3
  let g:netrw_altv=1
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"GUI settings
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

"Prevent jumping to last visited line when opening a file,
"as defined in the global /etc/vimrc.
  au! BufReadPost

" highlight the status bar when in insert mode
  if version >= 700
    au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
    au InsertLeave * hi StatusLine ctermbg=238 ctermfg=255
    "au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
  endif

"SAS code snippets
"  iabbrev hddr HEADER
  iabbrev hddr HEADER
  iabbrev cmmt <esc>C/* XQX<cr> */<cr><esc>2k=2jfXh,sC
  iabbrev mccr <esc>C%macro XXX();<cr><tab>XXX;<cr>%mend XXX;<cr><esc>3k=3jfXh2dwi
  iabbrev dtta <esc>Cdata XXX;<cr><tab>XXX;<cr>run;<cr><esc>3k=3jfXhC
  iabbrev ifff <esc>Cif XXX then<cr>do;<cr><tab>XXX;<cr>end;<cr><esc>4k=4jfXhvwec
  iabbrev iffe <esc>Cif XXX then<cr>do;<cr><tab>XXX;<cr>end;<cr><c-d>else<cr>do;<cr><tab>XXX;<cr>end;<cr><esc>8k=8jfXhvwec
  iabbrev slct <esc>Cselect (XXX);<cr>when (XXX)<cr>do;<cr>XXX;<cr>end;<cr>otherwise<cr>do;<cr>XXX;<cr>end;<cr>end;<cr><esc>10k=j10lbdwha
  iabbrev dolp <esc>Cdo i = 1 to XXX;<cr><tab>XXX;<cr>end;<cr><esc>3k=3jfXhvwec
  iabbrev doun <esc>Cdo until (XXX);<cr><tab>XXX;<cr>end;<cr><esc>3k=3jfXlciw
  iabbrev dowh <esc>Cdo while (XXX);<cr><tab>XXX;<cr>end;<cr><esc>3k=3jfXlciw
  iabbrev doit <esc>Cdo XXX = A, B, C;<cr><tab>XXX;<cr>end;<cr><esc>3k=3jfXhvwec
  iabbrev sqll <esc>Cproc sql;<cr><tab>select XXX<cr>from YYY<cr>where A EQ B;<cr>quit;<cr><esc>5k=5jj$2hciw


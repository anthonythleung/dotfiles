" Pathogen
execute pathogen#infect()

" Color Theme
colorscheme nord

" Basic Config
syntax enable
set tabstop=2  " number of visual spaces per TAB
set softtabstop=2  " number of spaces in tab when editing
set shiftwidth=2 " indent for autoindent
set expandtab  " tabs are spaces
set number  " show line numbers
set cursorline " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu  " visual autocomplete for command menu
set lazyredraw  " redraw only when we need to
set showmatch " highlight matching parenthesis
set incsearch " search as characters are entered
set hlsearch  " highlight matches
set mouse=a " enable mouse for all mode

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","  " leader key
inoremap jk <esc> " escape key

" Cool Tools
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession<CR>

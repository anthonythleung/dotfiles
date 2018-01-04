" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sjl/gundo.vim'

Plug 'airblade/vim-gitgutter'

Plug 'pangloss/vim-javascript'

Plug 'rust-lang/rust.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'w0rp/ale'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

" vim snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/goyo.vim'

call plug#end()
" Color Theme
colorscheme nord
let g:airline_powerline_fonts = 1

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
set noshowmode " hide status bar for airline
set clipboard=unnamed " yank and paste with the system clipboard
set scrolloff=10 " leave 10 lines above and below the cursor
set backspace=indent,eol,start " fix backspace
set splitright " fix split
set splitbelow " fix split

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

" nerd tree
nnoremap <Leader>f :NERDTreeToggle<Enter>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_cpp_gcc_options = "-std=c++14 -Wall -g"
let g:ale_linters = {
      \   'cpp': ['g++'],
      \}

" vim snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" remap pane key
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" automatic line number
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" spell check
map <leader>ss :setlocal spell!<cr>

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_toc_autofit = 1

" goyo
let g:goyo_width = 120

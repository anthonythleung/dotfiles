" ========== Plugins ==========
call plug#begin('~/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'

Plug 'w0rp/ale'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'


call plug#end()

" ========== COLOR SCHEME ==========
colorscheme nord
set termguicolors
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 15
let g:nord_uniform_diff_background = 1


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" ========== BASIC CONFIG ==========
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
set nowrap " no word wrap
set number relativenumber " automatic line number

" ========== MOVEMENT ==========
"                   Scroll down faster
noremap <C-e>       2<C-e>
"                   Scroll up faster
noremap <C-y>       2<C-y>
"                   Move vertically by visual line
nnoremap j          gj
nnoremap k          gk

" ========== NERDTREE ==========
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowLineNumbers = 0

" ========== NERDCOMMENTER ==========
let g:NERDSpaceDelims = 1

" ========== ALE ==========
let g:airline#extensions#ale#enable = 1
let g:ale_sign_column_always = 1
let g:ale_cpp_gcc_options = "-std=c++14 -Wall -g"
let g:ale_linters = {
      \    'cpp': ['g++'],
      \    'javascript': ['eslint', 'prettier']
\}

let g:ale_fixers = {
      \    'javascript': ['eslint', 'prettier']
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

" ========== DEOPLETE ==========
let g:deoplete#enable_at_startup = 1

" ========== GOYO ==========
let g:goyo_width = 120

" ========== JAVASCRIPT ===========
let g:jsx_ext_required = 0

" ========== INDENT LINE ==========
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" ==============================
" ========== MAPPINGS ==========
" ==============================

" set <space> to leader key
let mapleader = " "
" jk to <esc>
inoremap jk <esc>

" ========== EDITING =========
"                    Open Gundo (Undo Tree)
nnoremap <leader>u   :GundoToggle<CR>
"                    move to beginning/end of line
nnoremap B           ^
nnoremap E           $
nnoremap $           <nop>
nnoremap ^           <nop>


" ========== BUFFERS ==========
"                    Open new empty buffer
nnoremap <leader>n   :enew<CR>
"                    Move to the next buffer
nnoremap <leader>bn  :bnext<CR>
"                    Move to the previous buffer
nnoremap <leader>bp  :bprevious<CR>
"                    Close the current buffer
nnoremap <leader>bq  :bp<CR>:bd #<CR>
"                    Open Terminal
nnoremap <leader>bt  :terminal<CR>

" ========== FILES ==========
"                    Save current file
nnoremap <leader>w   :w<CR>
"                    Reveal file in NERDTree
nnoremap <leader>r   :NERDTreeFind<CR>
"                    Open NERDTree
nnoremap <leader>t  :NERDTreeToggle<CR>

" ========== WINDOWS ==========
"                    Quit while maintaining window arrangement for session
nnoremap <leader>Q   :qa<CR>
"                    Quit
nnoremap <leader>q   :q<CR>
"                    Window Movement
nnoremap <leader>h   <C-w>h
nnoremap <leader>l   <C-w>l
nnoremap <leader>k   <C-w>k
nnoremap <leader>j   <C-w>j

" ========== SEARCH ==========
"                    Toggle search highlighting
nnoremap <leader>i   :set hls!<CR>

" ========== FZF ==========
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_buffers_jump = 1
let g:fzf_height = 10


"                    Search open buffers
nnoremap <leader>fb  :Buffers<CR>
"                    Search buffer commits 
nnoremap <leader>fc  :BCommits<CR>
"                    Search commits
nnoremap <leader>fC  :Commits<CR>
"                    Search changed files 
nnoremap <leader>fd  :GFiles?<CR>
"                    Search old files and open buffers
nnoremap <leader>fe  :History<CR>
"                    Search lines in current buffer
nnoremap <leader>fl  :BLines<CR>
"                    Search lines in loaded buffer
nnoremap <leader>fL  :Lines<CR>
"                    Search marks
nnoremap <leader>fm  :Marks<CR>
"                    Search git files
nnoremap <leader>fo  :GFiles<CR>
"                    Search all files
nnoremap <leader>fO  :Files<CR>
"                    Search buffer tags
nnoremap <leader>ft :BTags<CR>
"                    Search all tags
nnoremap <leader>fT  :Tags<CR>
"                    Search windows
nnoremap <leader>fw  :Windows<CR>

" ========== GIT ==========
"                    Git status
nnoremap <leader>gs  :Gstatus<CR>
set updatetime=250

" ========== TERMINAL ==========
tnoremap <leader><Esc> <C-\><C-n>

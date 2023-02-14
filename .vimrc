"==================================================="
" 8b   d8           Yb    dP 888 8b   d8 888b. .d88b "
" 8YbmdP8 Yb  dP     Yb  dP   8  8YbmdP8 8  .8 8P    "
" 8  "  8  YbdP       YbdP    8  8  "  8 8wwK' 8b    "
" 8     8   dP         YP    888 8     8 8  Yb `Y88P "
"          dP                                        "
"==================================================="

""not compatible vi
set nocompatible

""set leader key
let mapleader=" "
let g:mapleader=" "

let &t_ut=''
""256color open
set t_Co=256
""highlight syntax
syntax on
""show row number
set number
set relativenumber
""show cursor location
set cursorline
""auto line break
set wrap
""show input cmd
set showcmd
""auto complement
set wildmenu
""search highlight
set hlsearch
exec "nohlsearch"
set incsearch
""set case in search
set ignorecase
set smartcase
""mouse set
set mouse=a
""encoding set
set encoding=utf-8
""indent set
set autoindent
set smartindent
""tab set
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
""display <Tab> & <Space>
set list
set listchars=tab:▸\ ,trail:▫
""set scroll retain
set scrolloff=10
""set statusline location
set laststatus=2
set autochdir
""set cursor styles different in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"
""Save the cursor location for the file where you edit it last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""force save
nnoremap s :w!<CR>
""sudo save
nnoremap <LEADER>s :w !sudo tee %<CR>
""force quit
nnoremap q :q!<CR>
""resource vimrc
nnoremap r :source $MYVIMRC<CR>
""cancel search highlight
nnoremap <CR> :nohlsearch<CR>

""select Visual-Block to line home
noremap <C-h> <C-v><HOME>
""select Visual-Block to line end
noremap <C-l> <C-v><END>
""select Visual-Block current word
noremap <C-w> <C-v>iw
""select Visual-Block to some char pre
noremap <LEADER>F <C-v>?
""select Visual-Block to some char post
noremap <LEADER>f <C-v>/
""openc my vimrc
noremap <LEADER>o :e ~/.vimrc<CR>
""copy to system clipboard
noremap y "+y
""Paste from system clipboard
noremap p "+p

""resize window
noremap <up>    : res +5<CR>
noremap <down>  : res -5<CR>
noremap <left>  : vertical resize-5<CR>
noremap <right> : vertical resize+5<CR>

""disable the key 's'
noremap s <nop>

""input real <Tab> in InsertMode
inoremap<Tab> <C-v><Tab>

""split window
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>

""switch window
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

""improve hjkl
nnoremap H \|
nnoremap J 5j
nnoremap K 5k
nnoremap L $

vnoremap H <HOME>
vnoremap J 5j
vnoremap K 5k
vnoremap L <END>

""statusline set
function! Get_mode()
	let currentMode = mode()
	if currentMode ==# "n"
		return "Normal"
	elseif currentMode ==# "v"
		return "Visual"
	elseif currentMode ==# "V"
		return "Visual-Line"
	elseif currentMode ==# ""
		return "Visual-Block"
	elseif currentMode ==# "s"
		return "Select"
	elseif currentMode ==# "S"
		return "Select-Line"
	elseif currentMode ==# ""
		return "Select-Block"
	elseif currentMode ==# "i"
		return "Insert"
	elseif currentMode ==# "R"
		return "Replace"
	elseif currentMode ==# "c"
		return "Command"
	elseif currentMode ==# "t"
		return "Terminal"
	else
		return currentMode
	endif
endfunction

set statusline=%1*\[%{Get_mode()}]\ %*    " Show currntMode
set statusline+=%2*\%<%.50F\              " Show file name and file path
set statusline+=%=%3*\%y%m%r%h%w\ %*      " Show file type and file status
set statusline+=%4*\%{&ff}\[%{&fenc}]\ %* " Show file encoding type
set statusline+=%5*\ row:%l/%L,col:%c\ %* " Display the row and column where the cursor is located
set statusline+=%6*\%3p%%\%*              " Display the proportion of the text in front of the cursor to the total text

hi User1 cterm=none ctermfg=4 ctermbg=0
hi User2 cterm=none ctermfg=25 ctermbg=0
hi User3 cterm=none ctermfg=208 ctermbg=0
hi User4 cterm=none ctermfg=169 ctermbg=0
hi User5 cterm=none ctermfg=100 ctermbg=0
hi User6 cterm=none ctermfg=green ctermbg=0

""auto parentheses
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i

""vim-plug set
call plug#begin('~/.vim/plugged')

Plug 'bluz71/vim-nightfly-colors'

Plug 'ptzz/lf.vim'

Plug 'voldikss/vim-floaterm'

Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/indentLine'

Plug 'godlygeek/tabular'

Plug 'gcmt/wildfire.vim'

Plug 'tpope/vim-surround'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'mbbill/undotree'

Plug 'preservim/tagbar'

call plug#end()

""colorscheme set
set termguicolors
set background=dark
"colorscheme default
colorscheme nightfly

""background transparent set
"hi Normal ctermfg=252 ctermbg=none

""tabular set
noremap <LEADER>t :Tab/

""vim-expand-region set
noremap <LEADER>s <Plug>(wildfire-fuel)
noremap <LEADER>r <Plug>(wildfire-water)

""MarkdownPreview set
"nnoremap <C-p> : MarkdownPreview<CR>
"nnoremap <C-p>  : MarkdownPreviewStop<CR>
nnoremap <C-p>    : MarkdownPreviewToggle<CR>

""set LF as FileManager
let g:lf_map_keys = 0
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
nnoremap <LEADER>m :Lf<CR>

""UndotreeToggle set
nnoremap <F5> :UndotreeToggle<CR>

""TagbarToggle set
nnoremap <F8> :TagbarToggle<CR>

""figlet set
nnoremap <LEADER><F12> :r !figlet -f thick ''<left>

""indentLine set
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

""coc.nvim set
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


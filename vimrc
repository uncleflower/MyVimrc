"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


source ~/.vim/markdown_shortcuts.vim

let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set wildmenu
set encoding=utf-8

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set mouse=a

noremap <LEADER><CR> :nohlsearch<CR>

"     ^
"     i 
"< j     l>
"     k
"     v

noremap i k
noremap k j
noremap j h
noremap h i
noremap H I
noremap I 5k
noremap K 5j
" Ctrl+j key: go to the start of the line
noremap J 0
" Ctrl+l key: go to the end of the line
noremap L $

inoremap <C-i> <up>
inoremap <C-j> <left>
inoremap <C-k> <down>
inoremap <C-l> <right>

map S :w<CR>
map s <nop>
map Q :q<CR>
map U <C-r>
map R :source $MYVIMRC<CR>

" set splite
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" set tabe
map ti :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

"Python's config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
	  Plugin 'Valloric/YouCompleteMe'
	  Plugin 'scrooloose/syntastic'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

color snazzy
let g:SnazzyTransparent = 1

" -----------------------------------------------------------------------------
" General
set number 	" Show line numbers 
set mouse=a	" Enable mouse 
set autoindent	" New lines inherit the indentation of previous lines.
set expandtab	" Convert tabs to spaces.
set undofile    " Save undo history
set undodir=~/.vim/undodir
set showcmd     " Show commands
set linebreak
set dy=lastline
set clipboard=unnamed
set tabstop=2 shiftwidth=2 expandtab
set hidden
set clipboard+=unnamedplus

" -----------------------------------------------------------------------------
" Searching
set hlsearch  " Highlighting
set smartcase " Automatically switch search to case-sensitive 
              " when search query contains an uppercase letter.

" -----------------------------------------------------------------------------
" Reading
" set cursorline " Highlight the line currently under cursor.
syntax enable
set wrap  " Wrap lines
set title " Show file title

" -----------------------------------------------------------------------------
" Shourtcuts
" Disable search highlight by Space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Enable spell check by F5
nnoremap <silent> <F5> :setlocal spell! spelllang=en_us,ru_ru<CR>
nmap <F6> :NERDTreeToggle<CR>

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Move lines
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" YAML formater
Plug 'tarekbecker/vim-yaml-formatter'

" Autosave
Plug 'chrisbra/vim-autosave'

" Autocomplete code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autosave plug
Plug '907th/vim-auto-save'

" File tree plugin 
Plug 'scrooloose/nerdTree'

" Quoting change auround the word
Plug 'tpope/vim-surround'

" Markdown preview plug 
Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() } }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

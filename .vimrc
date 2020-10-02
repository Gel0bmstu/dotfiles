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
set encoding=utf-8

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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Move lines
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
" Make sure you use single quotes

Plug 'ycm-core/YouCompleteMe'

" Autosave plug
Plug '907th/vim-auto-save'

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
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()



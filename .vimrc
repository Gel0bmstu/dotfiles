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
" -----------------------------------------------------------------------------
" Searching
set hlsearch  " Highlighting
set smartcase " Automatically switch search to case-sensitive 
              " when search query contains an uppercase letter.

" Press Space to turn off highlighting and clear any message already displayed.

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

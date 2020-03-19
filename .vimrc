" -----------------------------------------------------------------------------
" General
set number 	" Show line numbers 
set mouse=a	" Enable mouse 
set autoindent	" New lines inherit the indentation of previous lines.
set expandtab	" Convert tabs to spaces.

" -----------------------------------------------------------------------------
" Searching
set hlsearch  " Highlighting
set smartcase " Automatically switch search to case-sensitive 
              " when search query contains an uppercase letter.

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" -----------------------------------------------------------------------------
" Reading
" set cursorline " Highlight the line currently under cursor.
syntax enable
set wrap  " Wrap lines
set title " Show file title
set spell spelllang=en_us,ru_ru " Enable spellchecking

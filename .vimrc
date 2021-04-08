set encoding=utf-8
set hlsearch
set scrolloff=5
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set clipboard=unnamedplus
set number relativenumber
set ruler
set showcmd
set incsearch
" " autocomplete stuff
" set omnifunc=javascriptcomplete#CompleteJS
" set omnifunc=htmlcomplete#CompleteTags
" set omnifunc=csscomplete#CompleteCSS
" set omnifunc=phpcomplete#CompletePHP
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-c> :call system('xclip -selection clipboard', @0)<CR>
nnoremap <C-L> :nohl<CR><C-L>
call plug#begin('~/.vim/plugged')
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'ap/vim-css-color'
Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline-themes'
Plug 'hardcoreplayers/gruvbox9'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
call plug#end()
" Color scheme settings
let g:gruvbox_transp_bg=1
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
colorscheme gruvbox9
set background=dark
" Airline settings
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

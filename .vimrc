set encoding=utf-8
set hlsearch
set scrolloff=5
set tabstop=4
syntax on
set clipboard=unnamedplus
set number relativenumber
set ruler
set showcmd
set incsearch
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline-themes'
Plug 'hardcoreplayers/gruvbox9'
Plug 'tpope/vim-commentary'
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

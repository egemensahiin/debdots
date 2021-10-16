set encoding=utf-8
set nocompatible
set mouse=a
set hlsearch
set scrolloff=5
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set number relativenumber
set ruler
set showcmd
set incsearch
set splitbelow splitright
let mapleader=","
syntax on
" " autocomplete stuff
" set omnifunc=javascriptcomplete#CompleteJS
" set omnifunc=htmlcomplete#CompleteTags
" set omnifunc=csscomplete#CompleteCSS
" set omnifunc=phpcomplete#CompletePHP
call plug#begin('~/.vim/plugged')
Plug 'vim-latex/vim-latex'
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
Plug 'preservim/nerdcommenter'
"Plug 'xuhdev/vim-latex-live-preview'
call plug#end()
" keybindings
nnoremap <Leader><Left> :tabprevious<CR>
nnoremap <Leader><Right> :tabnext<CR>
nnoremap <Leader>T :tabnew<CR>
nnoremap <Leader>C :tabclose<CR>
nnoremap <C-c> :call system('xclip -selection clipboard', @0)<CR>
nnoremap <Leader>l :nohl<CR>
nnoremap <C-t> :bel term ++rows=10<CR>
nnoremap <Leader>n :Vexplore<CR>
nnoremap <Leader>s :vs<CR>
nnoremap <Leader>v :sp<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-l> <C-w>l<CR>
nmap <C-Up> :echom "Mapping C-Up"<CR>
nmap <C-Left> :echom "Mapping C-Up"<CR>
nmap <C-Down> :echom "Mapping C-Up"<CR>
nmap <C-Right> :echom "Mapping C-Up"<CR>
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
" LaTeX preview settings
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_engine = 'pdflatex'

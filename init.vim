""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Starting from scratch
""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
"Current line will display absolute number
set number
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'artur-shaik/vim-javacomplete2'
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_powerline_fonts = 1

"Javaaaaaaaaa
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"Tab name
let &titlestring = expand('%:p:h:t')
set title

syntax on
filetype indent plugin on
set background=dark

color dracula

set history=1000

"Auto complete for commands
set wildmenu

"Keep 20 context lines on screen(scrolloff[set])
set so=20

"You should be able to switch from a buffer without saving changes
"Caution with :qa!
set hidden

"Y should work the same way as C and D ("from here to the end of line")
map Y y$

"Smooth scrolling
set lazyredraw

"Whitout this Taboo would not remember tabs names
set sessionoptions+=tabpages,globals

""Do not exceed 100 characters per line
highlight ExtraWhitespace ctermbg=grey guibg=grey
call matchadd('ExtraWhitespace', '\s\+$', 11)

highlight OverLength ctermbg=lightred guibg=lightgrey
call matchadd('OverLength', '\%>100v.\+')


"Save session
map <F2> :mksession! ~/vim_session <cr>

"Reload session
map <F3> :source ~/vim_session <cr>

"Navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Navigation between tabs
noremap <C-g>t gt
noremap <C-g>T gT

"Navigation maps for terminal mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-g>t <C-\><C-n>gt
tnoremap <C-g>T <C-\><C-n>gT

map <F9> :set paste<CR>
map <F10> :set nopaste<CR>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

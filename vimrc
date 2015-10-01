""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Starting from scratch
""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
set relativenumber

syntax on
filetype indent plugin on
set background=dark
set foldmethod=indent
set foldlevel=99

:set history=1000

"Smooth scrolling
set lazyredraw
set ttyfast

" Close buffer but not split ( <b>uffer <d>elete )
nmap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

""Do not exceed 80 characters per line
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.*/

"Easymotion
map <Leader>w <Plug>(easymotion-bd-wl)
map <Leader>f <Plug>(easymotion-bd-fl)

"Navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Color is good
set t_Co=256

"Paste and nopaste shortcuts
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

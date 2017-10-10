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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'nvim/'}
Plugin 'zchee/deoplete-go'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'takac/vim-hardtime'
" Plugin 'vim-syntastic/syntastic'
"Plugin 'artur-shaik/vim-javacomplete2'
call vundle#end()            " required
filetype plugin indent on    " required


"Hardmode settings
let g:hardtime_maxcount = 3
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 1300
let g:hardtime_default_on = 1

" Autoformat file on save
let blacklist = ['md']
au BufWrite * if ! index(blacklist, &ft) < 0 | :Autoformat

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"Close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"Javaaaaaaaaa
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
"Tab name
let &titlestring = expand('%:p:h:t')
set title

"Copy to system clipboard
vnoremap <Leader>c "+y
"Paste from system clipboard
noremap <Leader>v "+p

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

"real tab for real bioinformaticians
inoremap <S-Tab> <C-V><Tab>


"Whitout this Taboo would not remember tabs names
set sessionoptions+=tabpages,globals

set cursorline
hi CursorLine term=bold cterm=bold guibg=grey
highlight Search ctermfg=grey
""Do not exceed 100 characters per line
highlight ExtraWhitespace ctermbg=grey guibg=grey
call matchadd('ExtraWhitespace', '\s\+$', 11)

" highlight OverLength ctermbg=lightred guibg=lightgrey
" call matchadd('OverLength', '\%>100v.\+')
" highlight Normal ctermbg=Blue

"Save session
map <F2> :mksession! ~/vim_session <cr>

"Reload session
map <F3> :source ~/vim_session <cr>

" GoRun
au FileType go nmap gr :GoRun <cr>

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

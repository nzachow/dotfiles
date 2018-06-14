""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Starting from scratch
""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
"Current line will display absolute number
set number
call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
" Plug 'SirVer/ultisnips'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'elmcast/elm-vim'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'Shougo/deoplete.nvim' ", { 'on': [] }
Plug 'fatih/vim-go', { 'on': [] }

Plug 'zchee/deoplete-go', { 'on': [] }
" Plug 'carlitux/deoplete-ternjs'
" Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx','typescript'] }
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript'

" Plug 'blindFS/vim-taskwarrior'

" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'maksimr/vim-jsbeautify'

Plug 'airblade/vim-gitgutter'
" Plug 'gcmt/taboo.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'simnalamburt/vim-mundo'
call plug#end()

"rainbow_parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType elm RainbowParentheses
augroup END

set undofile
set undodir=~/.nvim/undo

nnoremap <F5> :MundoToggle<CR>

" Preview changes for %s commands
set inccommand=split

" Cycle jumplist
nnoremap <tab> <c-o>
nnoremap <s-tab> <c-i>

set noshowmode

augroup load_go
  autocmd!
  autocmd InsertEnter * call plug#load('deoplete.nvim', 'vim-go', 'vim-airline', 'deoplete-go')
                     \| autocmd! load_go
augroup END

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
" set completeopt-=preview
" javascript beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"Close preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Tab name
let &titlestring = expand('%:p:h:t')
set title

"Copy to system clipboard
vnoremap <Leader>c "+y
"Paste from system clipboard
noremap <Leader>v "+p
"Go to last buffer
noremap <Leader>b :b#<CR>

noremap <Leader>j :cnext<CR>
noremap <Leader>k :cw<CR>

"FZF
noremap <Space> :FZF<CR>

"GoRun
map <Leader>g :GoRun<CR>
map <Leader>gg :GoCoverageToggle<CR>
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
" enable fmt on save
let g:go_fmt_autosave = 1
noremap gr :GoRename<CR>
noremap gf :GoReferrers<CR>

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

"real tab for real bioinformaticians
inoremap <S-Tab> <C-V><Tab>


"Whitout this Taboo would not remember tabs names
set sessionoptions+=tabpages,globals

set cursorline
hi CursorLine term=bold cterm=bold guibg=grey
highlight ExtraWhitespace ctermbg=grey guibg=grey
call matchadd('ExtraWhitespace', '\s\+$', 11)

" Highlight column 90
highlight OverLength ctermbg=lightred guibg=lightgrey
call matchadd('OverLength', '\%<91v.\%>90v')

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

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

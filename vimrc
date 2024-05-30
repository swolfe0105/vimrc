"******************************************************************************
" Pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
"******************************************************************************
" References
"--> http://nathan-long.com/blog/vim-a-few-of-my-favorite-things/
"******************************************************************************

let mapleader=","

" Color Scheme
syntax on
set t_Co=256
colorscheme desert

" General Config
set showmatch
set tw=80
set nowrap
set laststatus=2
set number
set ruler
set smartindent
set autoindent

" stop auto wrapping when in insert mode
set formatoptions-=t

" Bells
set belloff=all

" Window Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Highlight Search with reasonable colors
set hlsearch
highlight Search ctermfg=black ctermbg=blue

"******************************************************************************
"                               Tabs and Spaces 
"******************************************************************************

"TODO: add tabstop=8 for kernel development

let my_tab=4
execute "set tabstop=".my_tab
execute "set softtabstop=".my_tab
execute "set shiftwidth=".my_tab
set expandtab

" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction

map <F9> mz:execute TabToggle()<CR>'z

"******************************************************************************
"                                 Plugins
"******************************************************************************

"" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep='>'
augroup HITABFILL
    autocmd!
    autocmd User AirlineAfterInit hi airline_tab ctermbg=6
augroup END


"" NerdTree
let g:NERDTreeWinPos="right"
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" Git-Gutter Colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

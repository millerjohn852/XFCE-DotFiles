"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" Plugins {{{

" Specify a directory for plugins
call plug#begin('~/.vim/plugged') " Initialize plugin system
"Plug Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'morhetz/gruvbox'
Plug 'mcchrish/nnn.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'Shirk/vim-gas'
Plug 'Tetralux/odin.vim'
Plug 'sudar/vim-arduino-syntax'
call plug#end() " Stop calling the plugin system

" }}}

" Lightline Stuff {{{

" Enable lightline
set laststatus=2

" Don't show the mode at the bottom of vim anymore as it's pointless
set noshowmode

" ale stuff
let g:lightline = {}

let g:lightline.component_expand = {
	\  'linter_checking': 'lightline#ale#checking',
	\  'linter_infos': 'lightline#ale#infos',
	\  'linter_warnings': 'lightline#ale#warnings',
	\  'linter_errors': 'lightline#ale#errors',
	\  'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
	\     'linter_checking': 'right',
	\     'linter_infos': 'right',
	\     'linter_warnings': 'warning',
	\     'linter_errors': 'error',
	\     'linter_ok': 'right',
\ }

let g:lightline.active = {
	\ 'right': [
	\		[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
	\		[ 'lineinfo' ],
	\		[ 'percent' ],
	\		[ 'fileformat', 'fileencoding', 'filetype']
	\ ],
	\ 'left': [
	\		[ 'mode', 'paste' ],
	\		[ 'readonly', 'relativepath', 'modified' ]
	\ ]
\ }


" }}}

" NerdCommenter Settings {{{

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Toggle the state of the comment for the current line with Leader cc
map <leader>b <plug>NERDCommenterToggle

" Disable the default NERDCommenter keybinds
let g:NERDCreateDefaultMappings=0

" }}}

" Colours {{{

syntax on
set encoding=utf-8
set background=dark

set termguicolors

autocmd vimenter * ++nested colorscheme gruvbox

" }}}

" UI {{{

set syntax=on

set number relativenumber
set mouse=n
set colorcolumn=120

" Show indentation when indented with tabs
:set list lcs=tab:\.\ 

" }}}

" fzf Settings {{{

" When searching in files in directory don't include filename in search
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" }}}

" KeyBindings {{{

" Map leader key to ,
let mapleader = ","

" Toggle paste mode with F2
set pastetoggle=<F2>

" Spell-check set to <leader>o
map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Splits open at the bottom and right
set splitbelow splitright

" Split vim horizontally
map <leader>v :vsplit <CR>

" Allow switching between windows splits whilst holding down Ctrl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear vim search
map <leader>z :noh<CR>

" Toggle vim ALE
map <leader>a :ALEToggle<CR>

" Goyo plugin makes text more readable when writing prose:
map <leader>g :Goyo<CR>

" Toggle autopairs
let g:AutoPairsShortcutToggle = '<F3>'

" Show fzf search for files in current directory
map <F4> :Files<CR>
nnoremap <silent> <C-f> :Files<CR>

" Search in all files in directory
nnoremap <silent> <Leader>f :Rg<CR>

" Search vim buffers
nnoremap <silent> <Leader>b :Buffers<CR>

" Close current buffer
nnoremap <silent> <Leader>q :bp<BAR>bd#<CR>

" Create vertical split from current buffer
noremap <silent> <Leader>t :vert sb<BAR>bd#<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>` :set expandtab<CR>

" Edit AsyncTasks config file for current project
noremap <leader>w :AsyncTaskEdit<CR><CR>

" Compile current project
noremap <leader>c :AsyncTask file-build<CR>

" Run current project
noremap <leader>r :AsyncTask file-run<CR>

" }}}

" File stuff {{{

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
autocmd BufRead *.sql set filetype=mysql
au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml.ansible
autocmd BufEnter *.yml,*.yaml ALEDisable " Turn off ALE for yaml files
autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
autocmd BufRead *.odin set filetype=odin

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}}

" Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <Space> za " Open and close all folds

" }}}

" init.vim - Sourcing and editing {{{

nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim <bar> :doautocmd BufRead<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0



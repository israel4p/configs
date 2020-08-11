" Israel Pereira
 
" Plugins
call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale', { 'do': 'pip3 install flake8 isort yapf' }
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'hashivim/vim-terraform'
  Plug 'evanleck/vim-svelte'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'camspiers/lens.vim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-commentary'
call plug#end()

" Themes
syntax on
set background=dark

" Configuration Airline
let g:airline_powerline_fonts=1
let g:materialmonokai_subtle_airline=1
let g:airline_theme='gruvbox'

" vim-colorscheme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox

" Color Column all files
set colorcolumn=79

" Better display for messages
set cmdheight=2

" Number of lines
set number

" Mouse Select
set mouse=a

" Absolute line numbers
set rnu

" Preview actions
set inccommand=split

" Update gitgutter
set updatetime=100

" Search not case-sensitive when only lower-case chars used
set incsearch
set ignorecase
set smartcase

" Confirm quit
set confirm

" Title
set title

" UTF-8 Support
set encoding=utf-8

" Split Right
set splitright

" Highlighting cursor
set cursorline

" Enable clipboard (install xclip)
set clipboard=unnamedplus

" Configuracao json                                                                                                                 
let g:indentLine_fileTypeExclude = ['json']

" Configuracao svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

" Funcion
if !exists('*s:setupWrapping')
  fu s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfu
endif

" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Configuracao COC
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ }

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-python',
  \ 'coc-highlight',
  \ 'coc-emmet',
  \ 'coc-markdownlint',
  \ 'coc-pyright',
  \ 'coc-pairs',
  \ 'coc-svelte',
  \ 'coc-vetur'
  \ ]

" Configuracao ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines','trim_whitespace']}

" Configuracao de TAB
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd Filetype markdown setlocal expandtab shiftwidth=4 colorcolumn=79 smartindent
"autocmd BufRead,BufNewFile *.vue setfiletype html

" Atalhos

" Sair ctrl+q
map <C-q> :quit<cr>

" Salvar ctrl+s
map <C-s> :w<cr>

" Abre o NERDTree com Ctrl+\
map <C-\> :NERDTreeToggle<cr>
nmap <leader>r :NERDTreeFocus<cr>R<c-w>

" Chama o plugin fzf com Ctrl+p
nnoremap <c-p> :Files<cr>

" Executa programa python com F5
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python3 % <cr>
autocmd BufNewFile,BufRead *.js nnoremap <F5> :!node % <cr>
autocmd BufNewFile,BufRead *.sh nnoremap <F5> :!bash % <cr>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

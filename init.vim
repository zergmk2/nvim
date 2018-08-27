call plug#begin()
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'fisadev/FixedTaskList.vim'
Plug 'vim-airline/vim-airline'
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline-themes'
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/grep.vim'
Plug 'moll/vim-bbye'
Plug 'sbdchd/neoformat'
call plug#end()



"""""""""""""""""""""""""
""""     neoformat   """"
"""""""""""""""""""""""""
augroup astyle
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

"Sometimes it is helpful if your working directory is always the same as the file you are editing.
set autochdir

" insert space characters whenever the tab key is pressed
:set expandtab
" insert 4 spaces for a tab
:set tabstop=4
"the number of space characters inserted for indentation
:set shiftwidth=4

let g:python_host_prog = expand('/home/lucao/anaconda3/envs/py2.7/bin/python')
let g:python3_host_prog = expand('/home/lucao/anaconda3/envs/py3.6/bin/python')


" NERDTree
let NERDTreeShowHidden=0
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$[[file]]', '\.pyo$[[file]]', '*cache[[dir]]']

" Tagbar display
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 30

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Tasklist
map <F2> :TaskList<CR>

" Other settings
" set list listchars=trail:¬ª,tab:¬ª-
set list listchars=tab:>\ ,trail:-

set number relativenumber
set cursorline cursorcolumn colorcolumn=0 scrolloff=3
set splitbelow splitright noequalalways
set hlsearch incsearch ignorecase smartcase " Fix searching
"set mouse=a<Paste>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    colorscheme apprentice
else
    colorscheme fisa
endif

let g:pymode_options_colorcolumn = 0
let g:pymode_python = "python"
let g:pymode_lint = 0

"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"Open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <M-Left> :bprev<CR>
nmap <M-Right> :bnext<CR>

"Jedi automatically starts the completion
let g:jedi#popup_on_dot = 0
"I don't want the docstring window to popup during completion
"autocmd FileType python setlocal completeopt-=preview
:let mapleader = "\\"

:nnoremap <leader>q :Bdelete<CR>
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>c"
let g:jedi#rename_command = "<leader>r"
:set hidden
:set mouse=a

augroup previewWindowPosition
   au!
   autocmd BufWinEnter * call PreviewWindowPosition()
augroup END
function! PreviewWindowPosition()
   if &previewwindow
      wincmd K
   endif
endfunction 

map qq :pc<cr>


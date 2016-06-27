" => vim-plug
""""""""""""""
call plug#begin()

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Rip-Rip/clang_complete'
Plug 'SirVer/ultisnips'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plug 'jelera/vim-javascript-syntax'
Plug 'jnurmine/Zenburn'
Plug 'jnwhiteh/vim-golang'
Plug 'joelpet/vim-ft-config'
Plug 'kien/ctrlp.vim'
Plug 'lukerandall/haskellmode-vim'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'sandeepcr529/Buffet.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sukima/xmledit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/darkspectrum'

call plug#end()

" => General settings
""""""""""""""""""""""
set nocompatible "drop compatibility for Vi
set ignorecase "ignore case on searches and everywhere else
set infercase "make insert-matching preserve the already written characters
set mouse=a "enable the mouse in compatible terms for all modes
set number "enable line numbers
set smartcase "enable case sensitive search if pattern contains upper case
set wildmenu "show possible completion matches
set wildmode=list:longest "list all matches and complete to longest common string
set scrolloff=3 "minimal number of screen lines to keep above/below the cursor

" => Appearence options
""""""""""""""""""""""""
syntax enable "turn on syntax highlighting
set ruler "show the line and column number of the cursor position
set cursorline "highlight the screen line of the cursor
set laststatus=2 "always show statusline
set t_Co=256
let g:solarized_termcolors=256
set background=light
silent! colorscheme solarized "select colorscheme

" => Completion
""""""""""""""""
set pumheight=10 "maximum number of popup menu items for Insert mode completion
set completeopt=menuone,longest "show menu and complete longest, don't show preview window

" => Editing
"""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode

" => Indenting
"""""""""""""""
set autoindent "copy indent from current line when starting a new line
set tabstop=4 "number of spaces that a <Tab> in the file counts for
set softtabstop=4 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'


" => Key mappings
""""""""""""""""""
let mapleader = "," "change map leader (<Leader>)
"LaTeX-Box interfers with ,lv and ,ll in LaTeX-Suite so leave it like this for now.
"let maplocalleader = "," "change map leader (<Leader>)

" Quick Escape
inoremap jk <Esc>
inoremap JK <Esc>

" Switch to current dir
noremap <leader>cd :cd %:p:h<cr>

" Useful newline mapping when between braces. {|} => {\n<indent>|\n}
inoremap <S-CR> <CR><Esc>O

" Format JSON using python
noremap <leader>fj :%!python -m json.tool<cr>:set filetype=json<cr>

" => Plugins
"""""""""""""
  " Airline
  """"""""""
  let g:airline_theme = 'solarized'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " Buffet
  """""""""
  noremap <leader>bl :Bufferlistsw<cr>

  " clang_complete
  """""""""""""""""
  let g:clang_complete_auto=0
  let g:clang_snippets=1
  let g:clang_snippets_engine='ultisnips'
  let g:clang_use_library=1
  nnoremap <Leader>cq :call g:ClangUpdateQuickFix()<CR>

  " CtrlP
  """"""""
  nnoremap <Leader>pp :<C-U>CtrlP<CR>
  nnoremap <Leader>pb :<C-U>CtrlPBuffer<CR>
  let g:ctrlp_follow_symlinks = 1
  let g:ctrlp_match_window = 'min:5,max:10,results:100'
  let g:ctrlp_show_hidden = 0
  let g:ctrlp_working_path_mode = 0

  " delimitMate
  """"""""""""""
  let delimitMate_excluded_ft = "xml"

  " LatexBox
  """""""""""
  let g:LatexBox_latexmk_options = "-pvc"
  let g:LatexBox_output_type = "dvi"
  let g:LatexBox_cite_pattern = '\c\\\a*\(cite\|quote\)\a*\*\?\_\s*{'

  " NERD Tree
  """"""""""""
  "Toggle NERD Tree on/off
  nmap <silent> <F4> :NERDTreeToggle<CR>
  "Filter uninteresting files
  let NERDTreeIgnore = ['\.class$']

  " Syntastic
  """"""""""""
  let g:syntastic_c_config_file='.clang_complete'
  let g:syntastic_cpp_config_file='.clang_complete'

  " Tag list
  """""""""""
  "Toggle Tag list on/off
  nmap <silent> <F5> :TlistToggle<CR>


" => Autocommands
""""""""""""""""""

"Ensure that Vim includes the autocommands only once
if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "Prevent passwords from `pass` leaking into swap, backup and undo files
    autocmd BufNewFile,BufRead /dev/shm/pass.* \
    setlocal noswapfile nobackup noundofile

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
endif


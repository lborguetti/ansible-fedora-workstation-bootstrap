"""
" Plugins
"

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/site/plugged')

  Plug 'lifepillar/vim-solarized8'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'kien/ctrlp.vim'
  Plug 'godlygeek/tabular'
  Plug 'scrooloose/nerdcommenter'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'gcmt/wildfire.vim'
  Plug 'Shougo/neocomplcache'
  Plug 'fatih/vim-go'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-buftabline'

" Initialize plugin system
call plug#end()

"""
" Plugins  Settings
"

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Settings for Wildfire
let g:wildfire_objects = {
                 \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                 \ "html,xml" : ["at"],
                 \ }

" Settings for neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"""
" General
"

" Automatic reloading of .vimrc
autocmd! bufwritepost ~/.config/nvim/init.vim source %"
" Default script encoding
scriptencoding utf-8
" Enable mouse
set mouse=a
" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash
" Allow for cursor beyond last character
set virtualedit=onemore
" Store a ton of history (default is 20)
set history=1000
" Allow buffer switching without saving
set hidden
" '.' is an end of word designator
set iskeyword-=.
" '#' is an end of word designator
set iskeyword-=#
" '-' is an end of word designator
set iskeyword-=-
" Disable backup files
set nobackup
set noswapfile
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

"""
" Vim UI
"

syntax off
" Only show 15 tabs
set tabpagemax=15
" Display the current mode
set showmode
" SignColumn should match background
highlight clear SignColumn
" Show partial commands in status line and Selected characters/lines in visual mode
set showcmd

" Backspace for dummies
set backspace=indent,eol,start
" No extra spaces between rows
set linespace=0
" Line numbers on
" set number
" Set Line numbers to white color
highlight LineNr cterm=NONE ctermfg=white ctermbg=NONE
" Show matching brackets/parenthesis
set showmatch
" Find as you type search
set incsearch
" No Highlight search terms
set nohlsearch
" Windows can be 0 line high
set winminheight=0
" Case insensitive search
set ignorecase
" Case sensitive when uc present
set smartcase
" Show list instead of just completing
set wildmenu
" Command <Tab> completion, list matches, then longest common part, then all
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
" Backspace and cursor keys wrap too
set whichwrap=b,s,h,l,<,>,[,]
" Lines to scroll when cursor leaves screen
set scrolljump=5
" Minimum lines to keep above and below cursor
set scrolloff=5
" Disable auto fold code
set nofoldenable
set list
" Highlight problematic whitespace
set listchars=tab:▷\ ,trail:•,extends:#,nbsp:.
" Highlight only the lines that go past 80 characters
highlight ColorColumn ctermbg=white guibg=white
call matchadd('ColorColumn', '\%82v', 100)


"""
" Formatting
"

" Do not wrap long lines
set nowrap
" Indent at the same level of the previous line
set autoindent
" Copy the previous indentation on autoindenting
set copyindent
" Use indents of 4 spaces
set shiftwidth=4
" Tabs are spaces, not tabs
set expandtab
" An indentation every four columns
set tabstop=4
" Let backspace delete indent
set softtabstop=4
" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces
" Puts new vsplit windows to the right of the current
set splitright
" Puts new split windows to the bottom of the current
set splitbelow
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before
" you paste.
set pastetoggle=<F2>
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
" Setting to automatically remove trailing whitespace when saving a file
autocmd BufWritePre * :%s/\s\+$//e


"""
" Key maps
"

" Easy paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Easy copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <c-n> :enew<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>"
" Move to the next buffer
nmap <c-l> :bnext<CR>
" Move to the previous buffer
nmap <c-h> :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <c-k> :bp <BAR> bd #<CR>

" Settings for tabular
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" Plugins {
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/site/plugged')

  Plug 'lifepillar/vim-solarized8'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kien/ctrlp.vim'
  Plug 'godlygeek/tabular'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'gcmt/wildfire.vim'
  Plug 'Shougo/neocomplcache'
  Plug 'fatih/vim-go'
  Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()
"}

"""
" Plugins  Settings {

  " Settings for vim-airline {
  set laststatus=2
  let g:airline_theme = 'solarized'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#syntastic#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  "}

  " Settings for ctrlp {
  let g:ctrlp_max_height = 30
  set wildignore+=*.pyc
  set wildignore+=*_build/*
  set wildignore+=*/coverage/*
  "}

  " Settings for indent-guides {
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_enable_on_vim_startup = 1
  "}

  " Settings for Wildfire {
  let g:wildfire_objects = {
                     \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                     \ "html,xml" : ["at"],
                     \ }
  "}

  " Settings for neocomplcache {
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

  " Enable omni completion
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

  " Better navigating through omnicomplete option list
  " See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
  set completeopt=longest,menuone
  function! OmniPopup(action)
    if pumvisible()
      if a:action == 'j'
        return "\<C-N>"
      elseif a:action == 'k'
        return "\<C-P>"
      endif
    endif
    return a:action
    endfunction
  "}

  " Settings for syntastic {
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_auto_loc_list = 2
  let g:syntastic_enable_signs = 1
  let g:syntastic_check_on_wq = 0
  "}

"}

"""
" General {

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
  " Spell checking on
  "set spell
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

"}

"""
" Vim UI {
"

  " Settings for solarized8 {
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  syntax enable
  set background=dark
  colorscheme solarized8_dark
  " Only show 15 tabs
  set tabpagemax=15
  " Display the current mode
  set showmode
  " Highlight current line
  set cursorline
  " SignColumn should match background
  "highlight clear SignColumn
  " Show partial commands in status line and Selected characters/lines in visual mode
  set showcmd

  " Backspace for dummies
  set backspace=indent,eol,start
  " No extra spaces between rows
  set linespace=0
  " Line numbers on
  set number
  " Show matching brackets/parenthesis
  set showmatch
  " Find as you type search
  set incsearch
  " Highlight search terms
  set hlsearch
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
  set scrolloff=3
  " Disable auto fold code
  set nofoldenable
  set list
  " Highlight problematic whitespace
  set listchars=tab:▷\ ,trail:•,extends:#,nbsp:.
  " Highlight only the lines that go past 80 characters
  highlight ColorColumn ctermbg=red guibg=red
  call matchadd('ColorColumn', '\%82v', 100)

"}

" Formatting {
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

"}


"""
" Key maps {
"
  " Removes highlight of your last search"
  noremap <C-n> :nohl<CR>
  vnoremap <C-n> :nohl<CR>
  inoremap <C-n> :nohl<CR>

  " Easy paste from system clipboard
  nnoremap <Leader>p "+p
  nnoremap <Leader>P "+P

  " Easy copy to system clipboard
  vnoremap <Leader>y "+y
  nnoremap <Leader>y "+y

  " Easier moving of code blocks
  vnoremap < <gv
  vnoremap > >gv


  " "Fast quickfix navigation
  " nnoremap <Leader>n :cnext<CR>
  " nnoremap <Leader>N :cprev<CR>

  " "Substitute word under cursor
  " nnoremap <Leader>s yiw:%s,<C-r>",
  "
  " "vimgrep word under cursor
  " nnoremap <Leader>g yiw:vimgrep /<C-r>"/g

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

"}

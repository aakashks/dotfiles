"" Must have settings for Vim (add on all servers)
" Basic Settings
set nocompatible                  " Make Vim more useful
set number                         " Show line numbers
set relativenumber                 " Show relative line numbers
set title                          " Show filename in titlebar
set showmatch                      " Show matching brackets
set scrolloff=3                   " Scroll with 3 lines before window border
set noerrorbells                  " Disable error bells
set nostartofline                 " Don't reset cursor on move

" Syntax and Highlighting
syntax on                         " Enable syntax highlighting
set mouse=a                       " Enable mouse in all modes

" Indentation
set expandtab                     " Use spaces instead of tabs
set tabstop=4                     " 1 tab == 4 spaces
set shiftwidth=4                  " Indent with 4 spaces
set smarttab                      " Smart tabs
set autoindent                    " Auto-indent new lines
set smartindent                   " Smart indent for structured code
set wrap                          " Wrap lines
set lbr                           " Linebreak at word boundaries
set tw=500                        " Set text width for line breaking

" Disable auto-indentation settings for better paste behavior
set pastetoggle=<F2>
set clipboard=unnamedplus


" Basic Settings
set wildmenu                      " Enhance command-line completion
set esckeys                       " Allow cursor keys in insert mode
set backspace=indent,eol,start    " Allow backspace in insert mode
set ttyfast                       " Optimize for fast terminal connections
set encoding=utf-8 nobomb         " Use UTF-8 without BOM
set binary                        " Don’t add empty newlines at the end of files
set noeol                         " Avoid newline at the end

" Leader Key
let mapleader=","                    " Change mapleader to comma

" File Handling
set nobackup                      " No backup files
set nowb                          " No write backup
set noswapfile                    " No swap files
set modeline                      " Respect modeline in files
set modelines=4                   " Look at the first 4 lines for modeline
" set exrc                          " Enable per-directory .vimrc files
" set secure                        " Disable unsafe commands in per-directory files

" Visual Enhancements
set number                        " Enable line numbers
set relativenumber                " Use relative line numbers
set title                         " Show filename in titlebar
set ruler                         " Show cursor position
set showcmd                       " Show partial commands
set showmode                      " Show the current mode
set shortmess=atI                 " Suppress intro message
set cmdheight=1                   " Height of the command bar
set showmatch                     " Show matching brackets
set mat=2                         " Time to blink when matching brackets
set scrolloff=3                   " Scroll with 3 lines before window border
set hlsearch                      " Highlight searches
set ignorecase                    " Ignore case in searches
set smartcase                     " Case-sensitive if uppercase letter
set incsearch                     " Dynamic search highlighting

" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters
" set list                          " Display invisible characters

" Error and Performance Optimizations
set lazyredraw                    " Optimize for performance

" Commands and Key Bindings
noremap <leader>ss :call StripWhitespace()<CR> " Map <leader>ss to strip trailing whitespace
noremap <leader>W :w !sudo tee % > /dev/null<CR> " Save as root

" Visual Mode Key Bindings
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Helper Functions
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' ")
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/' . l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Automatic Commands
if has("autocmd")
    filetype on
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Custom Status Line and Cursor Line
" set laststatus=2                    " Always show the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" set cursorline                      " Highlight current line
" highlight CursorLine cterm=NONE ctermbg=darkgray guibg=#003f4f " Custom cursor line highlight

set number                              " turn on line numbers and highlight colors
set ruler                               " always show current positions along the bottom
set showcmd                             " show the command being typed
set autoindent                          " autoindent spaces
set autoread                            " set to auto read when a file is changed from the outside
set backspace=indent,eol,start          " allow backspace to delete indent, end of line, and over insert
set ignorecase smartcase                " case insensitive search
set hlsearch                            " highlight search
set showmatch                           " show matches while doing a search
set smartindent                         "
set smarttab                            "
set expandtab                           " use spaces for tabs
set nocursorline                        "
set nocursorcolumn                      "
set hidden                              " buffer settings
syntax on                               " syntax highlighting
syntax sync fromstart                   " most accurate but slowest syntax highlighting
let mapleader=','                       " start my mapped commands with comma

" key mappings for manipulating buffers
nmap <S-j> :bnext<cr>
nmap <S-k> :bprev<cr>
nmap <S-t> :enew<cr>
nmap <S-q> :bp <bar> bd #<cr>
nmap <S-l> :ls<cr>

" strip white space
nmap <leader>sw :call StripTrailingWhitespace()<cr>

" stop highlighting search terms after
nmap <leader>ch :noh<cr>

" autoload pathogen plugins
execute pathogen#infect()

" color settings/theme
set t_Co=256                            " 256 colors
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" plugin options
"let base16colorspace=256
" airline
set laststatus=2                        " always display airline status bar
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_theme='gruvbox'
" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_tidy_exec='tidy'
"let g:syntastic_html_tidy_ignore_errors = [ '<script> proprietary attribute' ]

" options for various file extensions
filetype plugin indent on
autocmd Filetype php setlocal sts=4 sw=4 expandtab
autocmd Filetype python setlocal sts=4 sw=4 expandtab
autocmd Filetype c setlocal sts=4 sw=4 expandtab
autocmd Filetype html setlocal sts=4 sw=4 expandtab

" custom functions
function! StripTrailingWhitespace()
        if !&binary && &filetype != 'diff'
                normal mz
                normal Hmy
                %s/\s\+$//e
                normal 'yz<cr>
                normal 'z
                retab
        endif
endfunction

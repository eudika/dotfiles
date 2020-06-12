scriptencoding utf-8

augroup MyAutoCmd
    autocmd!
augroup END


" <<< Environment >>>

set shellslash
let g:is_mac = has('mac')
let g:is_windows = has('win32') || has('win64')
let g:is_linux = has('unix') && !g:is_mac

" Usually ~/.config/nvim or %LOCALAPPDATA%\nvim
let g:config_home = expand($XDG_CONFIG_HOME? $XDG_CONFIG_HOME . '/nvim': stdpath('config'))
" Usually ~/.local/share/nvim or %LOCALAPPDATA%\nvim-data
let g:data_home = expand($XDG_DATA_HOME? $XDG_DATA_HOME . '/nvim': stdpath('data'))
" Usually ~/.cache/nvim or %TEMP%\nvim
let g:cache_home = expand($XDG_CACHE_HOME? $XDG_CACHE_HOME . '/nvim': stdpath('cache'))

let g:python3_host_prog = split(system(g:is_windows? 'where python': 'which python3'), '\n')[0]

" Usually ~/.cache/dein or %LOCALAPPDATA%\nvim-data\dein
" In windows, I don't use %TEMP%, where files are frequently cleared.
let g:dein_cache_home = expand($XDG_CACHE_HOME? $XDG_CACHE_HOME . '/dein':
            \ g:is_windows? stdpath('data') . '/dein':
            \ fnamemodify(stdpath('cache'), ':h') . '/dein')
let s:dein_local_repo = g:dein_cache_home . '/repos/github.com/Shougo/dein.vim'
let s:dein_config_home = g:config_home . '/dein'

set runtimepath&
let &runtimepath = s:dein_config_home . ',' . &runtimepath
if g:is_windows
    " Add qt runtime to the path
    let &runtimepath = &runtimepath . ',' . expand(fnamemodify($VIM, ':h') . '/nvim-qt/runtime')
endif


" <<< Preferences >>>

" < Localization >
set fileencodings=utf-8,shift-jis,euc-jp,ucs-bom,default
set fileformats=unix,dos
set formatoptions+=mM
set helplang=en,ja
set ambiwidth=double

" < Edit >
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set virtualedit=block,onemore
set showmatch
set clipboard& clipboard+=unnamedplus
set mouse=a
set hidden

" < Search >
set ignorecase
set smartcase

" < View >
set title
set number
set list
set listchars=tab:»-,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
if has('termguicolors')
    set termguicolors
endif

" < Window >
set splitbelow
set splitright

" < Misc Files >
let &backupdir = stdpath('data') . '/backup'
call mkdir(&backupdir, 'p')
set backup
set undofile


" << Hooks >>

" < File Type >
" Should I use ftdetect?
augroup FileTypeCmd
    autocmd!
    autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
    autocmd BufRead,BufNewFile *.toml setlocal filetype=toml
    autocmd BufRead,BufNewFile *.wsgi setlocal filetype=python
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
augroup END

" << Binary >>
augroup BinaryCmd
    autocmd!
    autocmd BufReadPre *.bin let &binary = 1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END


" <<< Mappings >>

" < Normal, Visual, Select, Operator-pending Mode >
noremap <SPACE>h ^
noremap <SPACE>l $

" < Normal Mode >
let g:mapleader = ","
nnoremap \ ,

nnoremap Q <NOP>
nnoremap <CR> A<CR><ESC>
nnoremap x "_x
nnoremap <silent> <C-l> :<C-u>nohl<CR><C-l>

nnoremap [search] <NOP>
nmap <SPACE> [search]
nnoremap <silent> [search]# "zyiw:let @/='\<'.@z.'\>'<CR>:set hls<CR>
nmap # [search]#:%s/<C-r>///g<LEFT><LEFT>

nnoremap [split] <NOP>
nmap s [split]
nnoremap [split]j <C-w>j
nnoremap [split]k <C-w>k
nnoremap [split]l <C-w>l
nnoremap [split]h <C-w>h
nnoremap [split]J <C-w>J
nnoremap [split]K <C-w>K
nnoremap [split]L <C-w>L
nnoremap [split]H <C-w>H
nnoremap [split]r <C-w>r
nnoremap [split]w <C-w>w
nnoremap [split]_ <C-w>_
nnoremap [split]<BAR> <C-w><BAR>
nnoremap [split]o <C-w>_<C-w><BAR>
nnoremap [split]+ <C-w>+
nnoremap [split]> <C-w>-
nnoremap [split]> <C-w>>
nnoremap [split]< <C-w><
nnoremap [split]= <C-w>=
nnoremap <silent> [split]s :<C-u>split<CR>
nnoremap <silent> [split]v :<C-u>vsplit<CR>
nnoremap <silent> [split]T :<C-u>tabnew<CR>
nnoremap [split]N gt
nnoremap [split]P gT
nnoremap <silent> [split]n :<C-u>bn<CR>
nnoremap <silent> [split]p :<C-u>bp<CR>
nnoremap <silent> [split]b :<C-u>b<CR>
nnoremap <silent> [split]B :<C-u>b<CR>
nnoremap <silent> [split]q :<C-u>bd<CR>
nnoremap <silent> [split]Q :<C-u>q<CR>

" < Insert Mode >
inoremap jj <ESC>


" <<< Commands >>>

command! -nargs=1 -complete=file Rename f <args>|call delete(expand("#"))


" <<< Plugin Manager >>>

if executable('git')
    if !isdirectory(s:dein_local_repo)
        execute '!git clone git://github.com/Shougo/dein.vim.git' s:dein_local_repo
    endif
    let &runtimepath = s:dein_local_repo . ',' . &runtimepath

    if dein#load_state(g:dein_cache_home)
        call dein#begin(g:dein_cache_home)
        call dein#load_toml(s:dein_config_home . '/immediate.toml', {'lazy': 0})
        call dein#load_toml(s:dein_config_home . '/lazy.toml', {'lazy': 1})
        call dein#end()
        call dein#save_state()
    endif

    if dein#check_install()
        call dein#install()
    endif
endif

filetype plugin indent on

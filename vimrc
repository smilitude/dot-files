" basic setup
set nocompatible
filetype plugin indent on
syntax on
set number
" set relativenumber
let mapleader=","
" set guifont=Monaco\ 10

" Vundle (plug-in manager) setups
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My plugins - do a :VundleInstall after adding a new one
" For some reason you'll have to close the vim window before running
" install command.
" Write :h vundle for help.
" TODO: document them
" Plugin 'SirVer/ultisnips'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'mattn/calendar-vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'tell-k/vim-autopep8'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Raimondi/delimitMate'
" Plugin 'scrooloose/nerdcommenter'
call vundle#end()

" TODO: explain why
filetype on

" Trigger configuration for ultisnips.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim needs to be told md is a markdown filetype explicitly.
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


"maps
" noremap <C-K> :ClangFormat<CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>N :NERDTree<cr>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" copying macro for linux
vmap <C-C> "+y
map <C-V> "+gP
map <C-A> ggVG
map <C-X> "+x
map <C-s> :w<CR>

" to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" to get into the current directory
function AlwaysCD()
  if bufname("") !~ "^ftp://"
    lcd %:p:h
  endif
endfunction
autocmd BufEnter * call AlwaysCD()

" common mistakes
abbreviate teh the
abbreviate tihs this
abbreviate itn int
abbreviate adn and

" not to break on words
set formatoptions=1
set linebreak

" fixing up moving in paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" avoiding escape key altogether
:imap jj <Esc>

" column after 80th character
" highlight ColorColumn ctermbg=magenta
" set colorcolumn=81

" tabs and others
set autoindent
set cindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set smarttab
set background=dark
set nohls
syntax enable

" show matching bracket
set mat=1

" removes trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" runs ClangFormat for CC files
autocmd BufWritePre *.cpp :ClangFormat
autocmd BufWritePre *.cc :ClangFormat
autocmd BufWritePre *.h :ClangFormat

" making golang/python tabs more readable locally
au BufNewFile,BufRead *.go setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.py setlocal noet ts=2 sw=2 sts=2

" for AutoFormat plugin.
au BufWrite * :Autoformat
let g:autoformat_retab = 0
" disable autoformat for certain file type
autocmd FileType vim,tex,snippets let b:autoformat_autoindent=0

" setups for autopep8 plugin for formatting python
let g:autopep8_indent_size = 2  " indent is 2
let g:autopep8_on_save = 1    " run autopep on save
let g:autopep8_disable_show_diff = 1  " don't show diff
" add more aggressive options (--aggressive --aggressive)
let g:autopep8_aggressive = 2

" use C++ 11 to compile for syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" allow copy-paste between different vim instances
:vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo<CR>
:nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" allow registers to store upto 10000 lines and 10000kb. '20 means it will
" remember marks in upto 20 files. this comes handy to copy a large number
" of lines.
" set viminfo='20,<10000,s10000,h

" TODO: explain why it's at the end
colorscheme molokai

" puts timestamp
:inoremap <F7> <C-R>=strftime("%H:%M")<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerful helpers for writing HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Packs of syntax highlighting theme for vim
Plugin 'flazz/vim-colorschemes'

" Complete airline for vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Highlights trailing whitespace in red
Plugin 'bronson/vim-trailing-whitespace'

" Change/add/edit surroundings (parenthesis, brackets, quotes, tags, ...)
Plugin 'tpope/vim-surround'

" Call RuboCop inside vim
Plugin 'ngmy/vim-rubocop'

" General-purpose fuzzy finder
Plugin 'junegunn/fzf'

" Helpers syntax/parsing for programming languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'plasticboy/vim-markdown'

" Helpers for developing with Rails
Plugin 'tpope/vim-rails'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"                     :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Add -a command to show the current syntax highlighting type/category (under the cursor)
autocmd FuncUndefined * exe 'runtime autoload/SyntaxAttr.vim'
map -a  :call SyntaxAttr()<CR>

" Remove trailing whitespaces when saving
autocmd BufWritePre * %s/\s\+$//e

" Show line numbers
set number

" Show wildmenu (helper when searching for files)
set wildmenu

" Tab settings
"" Expand tabs with whitespaces
set expandtab
"" Number of spaces used for indentation
set shiftwidth=2
set softtabstop=2

" Make search insensitive
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
" (like google instant search)
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Backup/swap files settings
set nobackup
set swapfile
set dir=~/.vim/swapfiles

" Highlight current line/column
set cursorline
set cursorcolumn

" Color the first 100 columns differently
let &colorcolumn=join(range(101,499),",")

" No folding markdown files
let g:vim_markdown_folding_disabled = 1

" Split movement remap
nnoremap <Esc>j <C-W>j
nnoremap <Esc>k <C-W>k
nnoremap <Esc>l <C-W>l
nnoremap <Esc>h <C-W>h

" Change alternate file
nnoremap <Esc>1 <C-^>

" FZF key binding
map <C-p> :FZF<CR>

" Enable copy to clipboard (C^C)
map <C-C> :w !pbcopy<CR><CR>

" Command aliases
ca WQ wq
ca Wq wq
ca wQ wq
ca W w
ca Q q

" Better split creation
set splitbelow
set splitright

" Active powerline font for airline
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline
let g:airline_powerline_fonts = 1

" Overall theme & Airline
set laststatus=2
colorscheme wradion
let g:airline_theme='powerlineish'

" Gemfile, *.ru are ruby syntax
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead *.ru set filetype=ruby

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

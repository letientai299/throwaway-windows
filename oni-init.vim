set nocompatible
syntax on
filetype plugin indent on

let mapleader="\<SPACE>"
let maplocalleader="\<SPACE>"

" Quickly open vimrc and apply change
nnoremap <Leader>ve :tabedit $MYVIMRC<CR>
nnoremap <Leader>vp :tabedit ~/.vim/plugins.vim<CR>
nnoremap <Leader>vl :tabedit ~/.vimrc_local<CR>
nnoremap <Leader>vL :tabedit ~/.local.plugins.vim<CR>
nnoremap <Leader>va :so $MYVIMRC<CR>

" Load the local config
if !empty(glob("~/.vimrc_local"))
  source ~/.vimrc_local
endif

"------------------------------------------------------------------------------
" The following script is copied from (with modification to use with my setup)
" https://davidxmoody.com/vim-auto-capitalisation/
" This make vim capitalize the first letter of the sentence.
func! WordProcessorMode()
    " Auto-capitalize script
    augroup SENTENCES
        au!
        autocmd InsertCharPre <buffer> if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
    augroup END

    map <buffer> j gj
    map <buffer> k gk
    setlocal wrap
endfu

com! WordProcessorMode call WordProcessorMode()


" Avoid using the Escape key
inoremap jk <ESC>
inoremap kj <ESC>
xnoremap jk <ESC>
xnoremap kj <ESC>

" Always show the line number
set number

" Use space (I hate tab)
set expandtab

" Use 2-spaces per tab
" set tabstop=2 softtabstop=2 shiftwidth=2
set tabstop=2 softtabstop=2 shiftwidth=2
set ignorecase smartcase incsearch hls
set textwidth=79
if !has('nvim')
  set encoding=utf8
endif
set cursorline
set nofoldenable

" Set spelling language to English, not sure if this setting could be included
" in the common.Vim
set spelllang=en_us
set nospell

" Quickly format the paragraph, and also a way to avoid enter Ex-mode
nnoremap gQ gqap


" Settings that required Leader key
"------------------------------------------------------------------------------

" Quickly paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" And quickly copy to clipboard also
nnoremap <Leader>y "+y
nnoremap <Leader>Y :.y+<CR>
vnoremap <Leader>y "+y

" Make Y copy to end the line like the D command
nnoremap Y y$

" Quickly toggle the color column
function! g:ToggleColorColumn() abort
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=+1
    endif
endfunction

nnoremap <silent> <leader>q :call g:ToggleColorColumn()<CR>


" Center the cursor on the screen after a search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Simulate Vim-surround behavior for deleting space around world
nmap ds<space> F<space>xf<space>x

" Insert mode delete forward one char
inoremap <C-d> <Del>

" Look up for help with vim keyword
augroup AutoCmdVim
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

call plug#begin('$HOME/.vim-plugged')
" }}}

" I'm try hard to reduce at much as possible the list of vim plugins I'm using,
" yet I keep experience with new stuff, while compare them with built-in vim
" feature (if it has one). Following plugins is what I feel essential.

" Sensible vim config, unnecessary for neovim, but still leave it here just in
" case I've to use Vim instead of Neovim
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" This plugin is said that should be built-in with Vim instead.
Plug 'tpope/vim-surround'

" Many keymap that felt natural enough for a wide range of built-in vim
" commands
Plug 'tpope/vim-unimpaired'

" This provide the repeat functionality for vim-surround and some other Tim Pope plugins
Plug 'tpope/vim-repeat'

" A strong enhancement for vim built-in abbreviation functions, but, to be
" honest, I only uses it to fix some common typos.
Plug 'tpope/vim-abolish'

" One plugins to rule all the different syntax and filetypes.
Plug 'sheerun/vim-polyglot', {'do': './build'}

" Vim-polyglot only provide filetype detection and syntax highlighting. I need
" more than that for editing markdown
Plug 'plasticboy/vim-markdown', {'for': ['md','markdown']}
Plug 'godlygeek/tabular', {'for': ['md','markdown']}

" Live-review markdown
Plug 'kannokanno/previm', {'for': ['md','markdown', 'wiki']}
Plug 'tyru/open-browser.vim', {'for': ['md','markdown', 'wiki']}

" Another plugin that provide many themes. Unnecessary if I can settle down
" for just one single theme. But, fuck it, I can't.
Plug 'flazz/vim-colorschemes'

" I'm using vimwiki for taking note. Markdown is not enough and I can't get into
" emacs and org mode despite all the times I've tried.
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

" Auto close the bracket and quotation pairs
Plug 'raimondi/delimitmate'

" The snippets engine and the a big collection of snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Quickly toggle line or block comment.
" I've considered switching to another commenting plugins (tcomment and
" commentary), but I hate switching my muscle memory for commenting code.
Plug 'scrooloose/nerdcommenter'

" Can't live without autoformating. Can't also live with unformatted code
Plug 'Chiel92/vim-autoformat'

" Pair with autoformat is auto stripping whitespace. This plugin also provide
" highlighting for trailing whitespsaces
Plug 'ntpeters/vim-better-whitespace'

" Linting engine
Plug 'w0rp/ale'

" Completion engine and supporting plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Auto cd to git project root when open a file in vim
Plug 'airblade/vim-rooter'

" Quickly resize vim split windows. Rarely use, but very annoying when doing
" that without this plugin
Plug 'simeji/winresizer'

" More text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

" Useful for review and reopen recent editing files, also serves as a bookmark.
Plug 'mhinz/vim-startify'

" More GUI stuffsý,

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'

" Vim-tabular provide a function to align text, and is required by vim-markdown
" for formatting table. But, it doens't provide any easy keymap to formatting
" text manually. Easy-align really does a better job in this case. But, it's
" ironic that I have to keep 2 plugins with the same feature within my vim.
Plug 'junegunn/vim-easy-align'

" Everyone say that this is a most powerful Git integrating for vim. I actually
" have a todo item for learning fugitive. But, right now, I use this mostly as a
" Commit browser and some nice syntax. Hope that I can find time to really learn
" it (or remove it, as oh-my-zsh with its git plugins is really enough for
" my work right now).
Plug 'tpope/vim-fugitive'

" Polyglot provided SQL syntax doensn't play nice with postgres code.
Plug 'lifepillar/pgsql.vim', {'for': ['sql', 'pgsql']}

" For SQL, I also follow the convention of making all SQL keyword uppercase.
Plug 'alcesleo/vim-uppercase-sql', {'for': ['sql', 'pgsql']}

" For editing todo note
Plug 'freitass/todo.txt-vim', {'for': ['todo']}

Plug 'skywind3000/asyncrun.vim'

" Loading local plugins {{{ "
" Leave a place to try some new plugins, before add it into this list
if !empty(glob('~/.local.plugins.vim'))
  source ~/.local.plugins.vim
endif

call plug#end()
" 1}}} "


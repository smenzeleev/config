"====================Autoinstall vim-plug========================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"================================================================

"====================Vim-Plug======================================
set nocompatible              " be iMproved, required
" filetype off                  " required
call plug#begin('~/.vim/plugged')

" =================Common Plugins================================
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' "Collection of lang. packs
Plug 'tpope/vim-commentary'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline' "Shows indent guides
Plug 'ryanoasis/vim-devicons' "Icons for nerdtree and etc.
Plug 'scrooloose/nerdtree' " enhanced netrw(file explorer)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" ==============================================================
"

"========================THEMES=================================
Plug 'chriskempson/base16-vim'
"===============================================================

call plug#end()

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
"
"=======================Common settings=========================
" Ru map keys
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set number
set noswapfile
set backupcopy=yes "https://webpack.js.org/configuration/watch/#vim
set winwidth=120
set nowrap "word wrapping
set tabstop=2
set backspace=indent,eol,start "https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
syntax enable
filetype plugin indent on    " required
let coffee_indent_keep_current = 1
"===============================================================

"========================Display settings=======================
set background=dark
set termguicolors
colorscheme base16-gruvbox-dark-hard
"===============================================================

"=========================AUTOCOMMANDS==========================
"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,coffee,vue set ai sw=2 sts=2 et
au BufNewFile, BufRead *.graphql setfiletype graphql
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.coffeescript
"autocmd FileType vue syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart " fixes vim randomly turns off syntax highlighting
"===============================================================

"=========================Clipboard=============================
 set clipboard+=unnamedplus
"===============================================================

"-------------------------MAPPINGS------------------------------
noremap <silent> <C-P> :Files<CR>
map <F7> :NERDTreeFind<CR>
map <F8> :NERDTreeToggle<CR>
"-------------------------MAPPINGS------------------------------

"-------------------------PLUGINS-------------------------------
"///////////////////////////////////////////////////////////////
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"---------------------------------------------------------------
"
"
"
"=========================NERDTree settings======================
let g:NERDTreeWinSize = 100
let g:NERDTreeAutoDeleteBuffer = 1
"=========================NERDTree settings======================
"
"=========================Airline settings======================
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1 "Needs to be installed https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"===============================================================
"
"=========================Deoplete==============================
"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\ 'javascript': ['ale']
\})
"=========================Deoplete==============================
"
"=========================ALE====================================
 " Enable completion where available.
 " This setting must be set before ALE is loaded.

 " You should not turn this setting on if you wish to use ALE as a completion
 " source for other completion plugins, like Deoplete.
 let g:ale_completion_enabled = 0
 let g:ale_linters = {
 \   'javascript': ['eslint', 'flow'],
 \}
 let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
 let g:ale_fixers = {
       \'javascript': 'prettier',
       \'scss': 'prettier',
       \'graphql': 'prettier'
       \}
 let g:ale_fix_on_save = 1
 let g:ale_sign_column_always = 1
 let g:ale_sign_error = '🤬'
 let g:ale_sign_warning = '🤔'
 let g:airline#extensions#ale#enabled = 1
 let g:ale_set_balloons = 1
 let g:ale_set_highlights = 1
 " Use ALE's function for omnicompletion.
 " set omnifunc=ale#completion#OmniFunc
 " set completeopt=menu,menuone,preview,noselect,noinsert " fix autoinsert issue
"=========================ALE====================================

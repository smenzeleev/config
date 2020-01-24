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
" =================Common Plugs================================
Plug 'bling/vim-airline'
Plug 'sheerun/vim-polyglot' "Collection of lang. packs
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline' "Shows indent guides
Plug 'ryanoasis/vim-devicons' "Icons for nerdtree and etc.
Plug 'scrooloose/nerdtree' " enhanced netrw(file explorer)
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ==============================================================
"

" =======================Snippets===============================
" Plug 'SirVer/ultisnips'
" Plug 'smenzeleev/vim-react-snippets'
" Plug 'file:///home/smenzeleev/development/vim-js-snippets'
" let g:UltiSnipsExpandTrigger=""
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" =======================Snippets===============================

"========================THEMES=================================
Plug 'nightsense/office'
Plug 'nightsense/simplifysimplify'
Plug 'felipesousa/rupza'
Plug 'rakr/vim-one'
Plug 'skielbasa/vim-material-monokai'
Plug 'lifepillar/vim-solarized8'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme' "dark plus
Plug 'NLKNguyen/papercolor-theme'
Plug 'doums/darcula'
"===============================================================

call plug#end()
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"=======================Common settings=========================
" Ru map keys
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set number
set noswapfile
set backupcopy=yes "https://webpack.js.org/configuration/watch/#vim
set winwidth=120
set nowrap "word wrapping
set tabstop=2
"set linebreak
"set nolist  " list disables linebreak
set backspace=indent,eol,start "https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
syntax enable
filetype plugin indent on    " required
let coffee_indent_keep_current = 1
"===============================================================

"========================Display settings=======================
set background=dark
set termguicolors
colorscheme default
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
"=========================ALE====================================
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
let g:ale_completion_enabled = 0 " completion provided by another plugin
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
" let g:ale_completion_symbols = {
" \ 'text': '',
" \ 'method': '',
" \ 'function': '',
" \ 'constructor': '',
" \ 'field': '',
" \ 'variable': '',
" \ 'class': '',
" \ 'interface': '',
" \ 'module': '',
" \ 'property': '',
" \ 'unit': 'unit',
" \ 'value': 'val',
" \ 'enum': '',
" \ 'keyword': 'keyword',
" \ 'snippet': '',
" \ 'color': 'color',
" \ 'file': '',
" \ 'reference': 'ref',
" \ 'folder': '',
" \ 'enum member': '',
" \ 'constant': '',
" \ 'struct': '',
" \ 'event': 'event',
" \ 'operator': '',
" \ 'type_parameter': 'type param',
" \ '<default>': 'v'
" \ }
" Use ALE's function for omnicompletion.
" set omnifunc=ale#completion#OmniFunc
" set completeopt=menu,menuone,preview,noselect,noinsert " fix autoinsert issue
"=========================ALE====================================
"
"=========================NERDTree settings======================
let g:NERDTreeWinSize = 100
let g:NERDTreeAutoDeleteBuffer = 1
"=========================NERDTree settings======================
"
"=========================Airline settings======================
let g:airline_theme='dark_minimal'
let g:airline_powerline_fonts = 1 "Needs to be installed https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"===============================================================
"
"=========================FZF===================================
"=========================FZF===================================
"
"=========================CTRL-P plugin settings================
"ignore directories and files
" let g:ctrlp_custom_ignore = {
" \'dir':  '/node_modules',
" \}


" " let g:ctrlp_by_filename = 1
" let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:20,results:20'
" if executable('ag')
"     " Use Ag over Grep
"     set grepprg=ag\ --nogroup\ --nocolor

"     " Use ag in ack
"     let g:ackprg = 'ag --vimgrep'

"     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'

"     " ag is fast enough that CtrlP doesn't need to cache
"     let g:ctrlp_use_caching = 0
" endif
"===============================================================

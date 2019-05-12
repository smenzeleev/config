"====================Vundle======================================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

" =================Common Plugins================================
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'sheerun/vim-polyglot' "Collection of lang. packs
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'Chiel92/vim-autoformat'
Plugin 'yggdroot/indentline' "Shows indent guides
Plugin 'vimwiki/vimwiki' "Personal Wiki for Vim http://vimwiki.github.io/
Plugin 'mattn/emmet-vim' "Configuration need
"Plugin 'jlanzarotta/bufexplorer' "Not need;
"Plugin 'mxw/vim-jsx' "Not need
"Plugin 'tpope/vim-surround' "Not need;Surrounding parentheses, brackets and etc. Usage: cs[old_parantheses][new_parentheses]
"Plugin 'raimondi/delimitmate' "Provides automatic closing of quotes, parenthesis, brackets, etc.
"Plugin 'yuttie/comfortable-motion.vim' "Brings physics-based smooth scrolling to the Vim/Neovim world!
"Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
" ==============================================================

" =======================Snippets===============================
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'isRuslan/vim-es6'
"Plugin 'justinj/vim-react-snippets'
Plugin 'smenzeleev/vim-react-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" =======================Snippets===============================

"========================Completions============================
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
"===============================================================

"========================THEMES=================================
Plugin 'nightsense/office'
Plugin 'nightsense/simplifysimplify'
Plugin 'felipesousa/rupza'
Plugin 'rakr/vim-one'
Plugin 'skielbasa/vim-material-monokai'
"Plugin 'sickill/vim-monokai'
Plugin 'lifepillar/vim-solarized8'
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
"===============================================================

"=======================Common settings=========================
call vundle#end()            " required
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
syntax enable
filetype plugin indent on    " required
let coffee_indent_keep_current = 1
"===============================================================

"========================Display settings=======================
set background=dark
set termguicolors
colorscheme gruvbox
"===============================================================

"=========================ON_START==============================
"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,coffee,vue set ai sw=2 sts=2 et
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.coffeescript
"autocmd FileType vue syntax sync fromstart
"au VimEnter * :NERDTreeCWD
"===============================================================

"=========================MAPPINGS==============================
map <F8> :NERDTreeToggle <CR>
map <F7> :NERDTreeFind <CR> 
"===============================================================

"=========================Clipboard=============================
"nvim Clipboard?
if has('nvim')
 set clipboard+=unnamedplus
endif
"===============================================================

"-------------------------PLUGINS-------------------------------
"///////////////////////////////////////////////////////////////
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"---------------------------------------------------------------

"=========================Airline settings======================
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1 "Needs to be installed https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"===============================================================

"=========================ALE===================================
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'eslint']
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Signs Text
let g:ale_sign_error = 'XX'
let g:ale_sign_warning = '!!'
"===============================================================

"=========================Emmet=================================
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key='<C-Y>'
let g:user_emmet_mode='a' "enable all function in all mode.
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
autocmd FileType html,css,javascript.jsx EmmetInstall
"===============================================================

"=========================CTRL-P plugin settings================
"ignore directories and files
"let g:ctrlp_custom_ignore = {
"      \'dir':  '/node_modules',
"      \'file': '\v\.(exe|so|dll)$',
"      \'link': 'some_bad_symbolic_links',
"}
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in ack
    let g:ackprg = 'ag --vimgrep'

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
"===============================================================

"===========================IndentLine=======================
" https://vimawesome.com/plugin/indentline
"===============================================================

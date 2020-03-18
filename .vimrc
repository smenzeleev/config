"====================Autoinstall vim-plug========================
let glob_url = has('nvim') ? '~/.local/share/nvim/site/autoload/plug.vim' : '~/.vim/autoload/plug.vim'
let url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(glob_url))
  :exe "!curl -fLo " . glob_url . " --create-dirs " . url
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"================================================================


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot' "Collection of lang. packs
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'

call plug#end()

set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set number
set noswapfile
set backupcopy=yes "https://webpack.js.org/configuration/watch/#vim
set winwidth=120
set nowrap "word wrapping
set tabstop=2
set backspace=indent,eol,start "https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set background=dark
set termguicolors "to work, terminal should support True Colors https://gist.github.com/XVilka/8346728; 
                  " If not work with tmux - change set -g default-terminal \"xterm-256color\" in .tmux.conf
set clipboard=unnamedplus "requires vim be compiled with +clipboard
set laststatus=2
set ruler
syntax enable
filetype plugin indent on    " require
colorscheme base16-monokai


" https://superuser.com/questions/457911/in-vim-background-color-changes-on-scrolling
if &term =~ '256color' || &term =~ 'kitty'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,coffee,vue,vim set ai sw=2 sts=2 et
au BufNewFile, BufRead *.graphql setfiletype graphql
autocmd BufEnter * :syntax sync fromstart " fixes vim randomly turns off syntax highlighting

noremap <silent> <C-P> :GFiles<CR>
noremap <silent> <Leader>b :Buffers<CR>

"Ale
 let g:ale_linters = {
 \   'javascript': ['eslint'],
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
 " let g:airline#extensions#ale#enabled = 1
 let g:ale_set_highlights = 1


"====================Autoinstall vim-plug========================
let glob_url = has('nvim') ? '~/.local/share/nvim/site/autoload/plug.vim' : '~/.vim/autoload/plug.vim'
let url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(glob_url))
  :exe "!curl -fLo " . glob_url . " --create-dirs " . url
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
" Plug 'dense-analysis/ale'
" ========================COC-PLUGINS============================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-marketplace',
Plug 'neoclide/coc-emmet'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile'}
" Plug 'amiralies/coc-flow'
" Plug 'neoclide/coc-eslint'
" Plug 'neoclide/coc-prettier'
" ===============================================================
"
" ==============================================================
"

"========================THEMES=================================
Plug 'chriskempson/base16-vim'
" Plug 'endel/vim-github-colorscheme'
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
colorscheme base16-brewer
"===============================================================

"=========================AUTOCOMMANDS==========================
"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,coffee,vue,vim set ai sw=2 sts=2 et
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
noremap <silent> <Leader>b :Buffers<CR>
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
let g:airline_theme='base16_brewer'
let g:airline_powerline_fonts = 1 "Needs to be installed https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"===============================================================
"
"=========================ALE====================================
 " Enable completion where available.
 " This setting must be set before ALE is loaded.

 " You should not turn this setting on if you wish to use ALE as a completion
 " source for other completion plugins, like Deoplete.
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
 let g:airline#extensions#ale#enabled = 1
 let g:ale_set_highlights = 1
 " Use ALE's function for omnicompletion.
 " set omnifunc=ale#completion#OmniFunc
 " set completeopt=menu,menuone,preview,noselect,noinsert " fix autoinsert issue
"=========================ALE====================================
"
"
"=========================COC====================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"=========================COC====================================
"

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'

" source vundle plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'w0rp/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'hail2u/vim-css3-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

" apply jellybeans as colorscheme
set termguicolors
colorscheme jellybeans
let g:jellybeans_overrides = {
\    'background': { 'guibg': '0d0d11' },
\}

" enable airline theme and populate powerline fonts
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" vim-markdown stuff
let g:vim_markdown_folding_disabled = 1

" ignore node modules
let g:ctrlp_custom_ignore = '\vnode_modules'

" misc settings
syntax on
set number

" a plugin
source ~/.vim/plugin/matchit.vim
filetype plugin on

" more regular expressions when searching
nnoremap / /\v
vnoremap / /\v

" set tab size
set tabstop=2
set shiftwidth=2
set expandtab

" jj as escape
inoremap jj <esc>

" coc.nvim stuff
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" ale stuff
let g:ale_open_list = 'on_save'
let g:ale_list_window_size = 2

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" ale - Close location list on buffer close:
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

execute pathogen#infect()

let g:ycm_global_ycm_extra_conf = $VIM . '\.ycm_extra_conf.py'

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" misc
set nowrap              " do not wrap lines
set guioptions+=a       " enable copy-on-select on windows
" colours
colorscheme solarized   " Ethan Schoonover's colorscheme
set background=dark     " dark/light
syntax enable           " enable syntax processing
" spaces and tabs
set tabstop=4           " number of visual spces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are space
" ui
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
" searching
set incsearch           " search as characters are entered
set hlsearch            " hightlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" custom movement
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" custom leader
let mapleader=","       " override default  key backslash \
" edit vimrc/zshrc and load vimrc bindings
" nnoremap ev :vsp $MYVIMRC<CR>
" nnoremap sv :source $MYVIMRC<CR>

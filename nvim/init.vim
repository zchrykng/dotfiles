if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.local/share/nvim/markdown2ctags.py'))
  silent !curl -fLo ~/.vim/markdown2ctags.py --create-dirs
    \ https://raw.githubusercontent.com/jszakmeister/markdown2ctags/master/markdown2ctags.py
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'HerringtonDarkholme/yats.vim'

" nvim specific plugins
Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })
Plug 'zchee/deoplete-go', Cond(has('nvim'), { 'do': 'make'})
Plug 'wokalski/autocomplete-flow', Cond(has('nvim'))
Plug 'Shougo/neosnippet', Cond(has('nvim'))
Plug 'Shougo/neosnippet-snippets', Cond(has('nvim'))
Plug 'SevereOverfl0w/deoplete-github', Cond(has('nvim'))
Plug 'mhartington/nvim-typescript', Cond(has('nvim'), { 'do': './install.sh' })
Plug 'landaire/deoplete-swift', Cond(has('nvim'))

" gvim/mvim specific plugins


call plug#end()

" Some basic setup
set number

" Airline setup
let g:airline#extensions#tabline#enable = 1

" Tagbar setup
nmap <F4> :TagbarToggle<CR>

" NERDTree setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F3> :NERDTreeToggle<CR>

" deoplete setup
let g:deoplete#sources = {}
let g:deoplete#sources.gitcommit=['github']

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.gitcommit = '.+'

call deoplete#util#set_pattern(
  \ g:deoplete#omni#input_patterns,
  \ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])


" Tagbar CTAGS
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.local/share/nvim/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

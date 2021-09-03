call plug#begin('~/.vim/plugged')
" TOO SLOW Plug 'jeaye/color_coded'
"Plug 'AD7six/vim-independence'
"Plug 'FuzzyFinder'
"Plug 'L9'
"Plug 'rking/ag.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'Valloric/YouCompleteMe'
"Plug 'bling/vim-airline'
"Plug 'vim-syntastic/syntastic'
" only break things for terminal Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'FelikZ/ctrlp-py-matcher'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-monokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'wikitopian/hardmode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

" indentation
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set tabstop=2 shiftwidth=2 noexpandtab smarttab
set scrolloff=8
set tw=0 wm=0
au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

set incsearch hlsearch showmatch
set number relativenumber

" bash-like TAB completion
set wildmode=longest,list

" Navigate through completion variants using ← and →
set wildmenu

" Case insensitive search if all lowercase
set ignorecase smartcase

" Apply rename to all matches in line
set gdefault

" Show unprintable chars
set list
"set listchars=tab:▹\ ,eol:¬
set listchars=tab:→\ ,eol:¬

set background=dark
"colorscheme default
"colorscheme railscasts
"colorscheme solarized
"colorscheme zenburn
"colorscheme molokai
"colorscheme seoul256
"not needed for terminal colorscheme dracula

" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" cscope
set cscopeverbose
set cscopequickfix=g-,s-,c-,d-,i-,t-,e-,a-
" enable using scope as tags
set cscopetag


" Highlight extra whitespaces at the end
highlight ExtraWhitespace ctermbg=red guibg=red
au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Use Ag as default grep if available
"if executable('ag')
"	set grepprg=ag\ --nogroup\ --nocolor\ --column
"	set grepformat=%f:%l:%c:%m
"	command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright
"	copen
"endif

" " vim-airline
" let g:airline_powerline_fonts = 0
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_b = ''
" let g:airline_section_x = ''
" let g:airline_section_y = ''

" CtrlP matcher
"let g:path_to_matcher = ~/src/matcher/matcher
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
"let g:ctrlp_match_func = { 'match': 'GoodMatch' }
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['tag']

" hardmode
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=#282a36 ctermbg=235
hi IndentGuidesEven guibg=#383a46 ctermbg=236

" GLSL syntax
" autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440

" Tagbar
nmap <F8> :TagbarToggle<CR>

" S P E E D
let g:airline_highlighting_cache=1
set ttyfast
set lazyredraw

" Rust
" PLS JUST NO
let g:rust_recommended_style = 0
let g:rustfmt_autosave = 1

" rust-ctags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" CoC
" set tagfunc=CocTagFunc
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


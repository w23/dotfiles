call plug#begin('~/.vim/plugged')
" TOO SLOW Plug 'jeaye/color_coded'
"Plug 'AD7six/vim-independence'
"Plug 'FuzzyFinder'
"Plug 'L9'
"Plug 'rking/ag.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline-themes'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
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
Plug 'vim-syntastic/syntastic'
Plug 'wikitopian/hardmode'
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

" indentation
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set tabstop=2 shiftwidth=2 noexpandtab smarttab
set so=8
set tw=0 wm=0
au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

set incsearch
set number relativenumber

" bash-like TAB completion
set wildmode=longest,list

" Navigate through completion variants using ← and →
set wildmenu

set background=dark
"colorscheme default
" colorscheme railscasts
"set background=dark
"colorscheme solarized
"colorscheme zenburn
"colorscheme molokai
"let g:seoul256_background = 236
let g:seoul256_background = 234
colo seoul256

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

" vim-airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

" CtrlP matcher
"let g:path_to_matcher = ~/src/matcher/matcher
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
"let g:ctrlp_match_func = { 'match': 'GoodMatch' }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['tag']

" hardmode
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" indent-guides
"let g:indent_guides_auto_colors = 1
hi IndentGuidesOdd  guibg=#3B3B3B ctermbg=235
hi IndentGuidesEven guibg=#343434 ctermbg=236
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey

" GLSL syntax
" autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl440

" solarized hack
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" Syntastic
set statusline+=%f
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_error_symbol = "E"
"let g:syntastic_warning_symbol = "W"

" Tagbar
nmap <F8> :TagbarToggle<CR>

" YouCompleteMe
"nnoremap y :YcmForceCompileAndDiagnostics
"nnoremap pg :YcmCompleter GoToDefinitionElseDeclaration
"nnoremap pd :YcmCompleter GoToDefinition
"nnoremap pc :YcmCompleter GoToDeclaration
let g:ycm_auto_trigger = 0
nnoremap <F5> :YcmRestartServer<CR>
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>

" S P E E D
let g:airline_highlighting_cache=1
set ttyfast
set lazyredraw

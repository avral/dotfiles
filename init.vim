call plug#begin('~/.vim/plugged')

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"
"" C++ TEST
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"Plug 'w0rp/ale'
"Plug 'rhysd/vim-clang-format'
"Plug 'vim-scripts/a.vim'
"
"
" Themes
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'

Plug 'tomlion/vim-solidity'

" Plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" easy motion
Plug 'easymotion/vim-easymotion'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'

" For airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Python
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'vim-scripts/indentpython.vim'
"Plug 'davidhalter/jedi-vim' " // вырубил так как есть deoplete TODO глючит превью с функциями 
"Plug 'zchee/deoplete-jedi'
Plug 'hdima/python-syntax'
"Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'


"Plug 'Shougo/deoplete.nvim', { 'tag': '2.0', 'do': ':UpdateRemotePlugins' }
"Plug 'wokalski/autocomplete-flow'
" For func argument completion
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

"Plug 'neomake/neomake'
"Plug 'Shougo/neocomplete'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
"Plug 'thinca/vim-ref'
"Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }


" Ruby
Plug 'vim-ruby/vim-ruby'

" JS
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'digitaltoad/vim-pug'

"Plug 'posva/vim-vue'
Plug 'storyn26383/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jaawerth/neomake-local-eslint-first'
"Plug 'othree/yajs.vim', { 'tag': '1.6' }
"Plug 'othree/es.next.syntax.vim'

"Plug 'othree/yajs.vim', {
"            \   'for': ['javascript', 'vue']
"            \ }


" Smali
Plug 'kelwin/vim-smali'

call plug#end()



" Coc.nvim
set statusline^=%{coc#status()}
let g:airline#extensions#coc#enabled = 1
nmap <silent> <S-f> <Plug>(coc-definition)
"nnoremap <S-f> :call CocAction('jumpDefinition', 'tab') <CR>



"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
set ma
set showcmd             " show (partial) command in status line
"set number              " show (partial) command in status line

filetype plugin indent on
set guicursor=

" Theme
set background=dark

syntax on
"colorscheme onedark
colorscheme OceanicNext
"colorscheme dracula

" HTML 
syntax region vueMustache start=/{{/lc=2 end=/}}/me=e-2 contains=@htmlJavaScript contained
syntax match vueMustacheStart /{{/ nextgroup=vueMustache
syntax match vueMustacheEnd /}}/
highlight link vueMustacheStart Delimiter
highlight link vueMustacheEnd Delimiter
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
"let syntastic_mode_map = { 'passive_filetypes': ['html'] }
"au BufNewFile,BufRead *.html set b:syntastic_skip_checks = 1


" Autocomplete
let g:neosnippet#enable_snipmate_compatibility = 1

" Python
syn keyword pythonStatement self

"let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#server_timeout=30
"let g:deoplete#sources#jedi#python_path = 'python3'
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#enable_at_startup = 1


let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = 'F'  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = '<Leader>_K'  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#use_tabs_not_buffers = 1

" Unite/ref and pydoc are more useful.
"let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1


" C++
" let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang'
" let g:deoplete#sources#clang#clang_header = '/usr/local/bin/eosio-cpp'

"
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'

"let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/7.0.1/lib/libclang.dylib'
"let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/7.0.1/lib/clang'


let g:neomake_cpp_enabled_makers = ['clang']
"let g:neomake_cpp_enabled_makers = ['clangtidy']
"let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-pedantic', '-ferror-limit=0']
            ""-I /usr/local/Cellar/eosio.cdt/1.6.2/opt/eosio.cdt/include/boost",

let g:neomake_cpp_clang_args = [
            \ "-std=c++17",
            \ "-I/usr/local/Cellar/eosio.cdt/1.6.2/opt/eosio.cdt/include",
            \ '-O3',
            \ '-Wextra',
            \ '-Wall',
            \ '-Iinclude',
            \ '-fforce-enable-int128',
            \ '-ferror-limit=0',
            \ '-g',
            \ ]


"let g:neomake_cpp_clang_args = ['-std=c++1z', '-Iinclude', '-ferror-limit=0']

"let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-Wno-unused-parameter', '-g', '-ferror-limit=0']
"let g:neomake_cpp_clangtidy_args = ['-ferror-limit=0']
"let g:neomake_cpp_clangcheck_args = ['-ferror-limit=0']

"let g:neomake_c_enabled_maker=["clang"]
"let g:neomake_c_clang_maker=['-ferror-limit=0']


let g:deoplete#sources#clang#flags = ["-x", "c++"]

" Emmet

" Syntax
" vue
" let g:vue_disable_pre_processors = 1
autocmd FileType vue syntax sync fromstart

" ESlint
"let g:neomake_verbose = 3
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'


"
"au BufRead,BufNewFile *.vue set ft=html
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.css

"autocmd! BufWritePost * Neomake
let python_highlight_all = 1
let g:neomake_python_enabled_makers = ['flake8']

"set noshowmode
"set noruler
" Airline
let g:airline#skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme = 'hybrid'
let g:airline_solarized_bg='dark'


if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


nnoremap <C-p> :FZF<CR>
map <silent> <F2> :NERDTreeToggle %:p:h<CR>
set clipboard+=unnamedplus

" JS
" Use deoplete.

"let g:deoplete#sources#ternjs#filter = 0
"let g:deoplete#sources#ternjs#types = 1
"let g:deoplete#sources#ternjs#depths = 1
"let g:deoplete#sources#ternjs#timeout = 1
"let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = 1  " This do disable full signature type on autocomplete
"
""Add extra filetypes
"let g:tern#filetypes = [
"                \ 'jsx',
"                \ 'javascript.jsx',
"                \ 'vue',
"                \ ]

set completeopt=longest,menuone,preview

"Add extra filetypes
"let g:syntastic_html_checkers = ['tidy']

set shiftwidth=4
set tabstop=4
set expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

autocmd Filetype cpp setlocal ts=3 sts=3 sw=3
autocmd Filetype hpp setlocal ts=3 sts=3 sw=3


" Табы
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Ignor fiels
let g:NERDTreeWinSize=30
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'npm-debug.log*', '\.*.gch.tmp', 'ghostdriver.log']
set completeopt-=preview

" Поиск по тексту
"let g:ackprg = 'ag —vimgrep'
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


nnoremap <F3> :set hlsearch!<CR>
":ino <C-C> <Esc> TODO Remove legasy, so i change Caps Lock to Esc


"let g:vue_disable_pre_processors=1
"autocmd FileType vue syntax sync fromstart
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
"au BufNewFile,BufRead *.vue setf vue
"let g:used_javascript_libs = 'vue,react'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

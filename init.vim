call plug#begin('~/.vim/plugged')

" Themes
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'

" Syntax
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'

" Commnets
"Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-commentary'

" Coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Other
Plug 'tomlion/vim-solidity'
"
"" Plugins

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
"Plug 'nvim-tree/nvim-tree.lua'

Plug 'Xuyuanp/nerdtree-git-plugin'
"
"Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
"
" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'

" Python
Plug 'hdima/python-syntax'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" HTML
Plug 'digitaltoad/vim-pug'
Plug 'cakebaker/scss-syntax.vim'

" JS
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'storyn26383/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leafgarland/typescript-vim'
"Plug 'othree/es.next.syntax.vim'

" Smali
Plug 'kelwin/vim-smali'



call plug#end()

" Пробую зафиксить ебаную проблему при сохранении
" E382: Cannot write, 'buftype' option is set
set buftype=""
set encoding=utf-8
let g:syntastic_auto_jump = 0

" Попробую
"inoremap <C-c> <ESC>
inoremap <C-c> <nop>
"map <C-c> !notify-send -u critical 'Stop that'<CR>
"
"
"!notify-send -u critical 'Stop that'<CR>

" Coc.nvim
" TEST
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_node_path = '/Users/avral/.nvm/versions/node/v16.3.0/bin/node'

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

" FIXME Может вот эта херня и была багом
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

"Use `[g` and `]g` to navigate diagnostics
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
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
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

"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

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


let g:airline#extensions#coc#enabled = 1
"set statusline^=%{coc#status()}
let g:airline#extensions#coc#enabled = 1
nmap <silent> <S-f> <Plug>(coc-definition)


" ALE
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_virtualtext_cursor = 0

hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

let g:ale_fix_on_save = 1

"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\}
let g:ale_linters = {
\   'cpp': ['cquery'],
\}


"let g:ale_cpp_cc_executable = '<auto>'
"let g:ale_cpp_cc_options = '-std=c++17 -Wall'
"let g:ale_cpp_clang_executable = '/usr/local/opt/blanc/opt/blanc/bin/blanc+++'
"let g:ale_cpp_clang_options = '-std=c++17 -Wall'
"let g:ale_cpp_gcc_executable = 'gcc-10'
"let g:ale_cpp_gcc_options = '-std=c++17 -Wall'




" NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au StdinReadPre * let s:std_in=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif FIXME

"set fillchars+=vert:\ 
let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

" Python
syn keyword pythonStatement self

" Vue
autocmd FileType vue syntax sync fromstart

let python_highlight_all = 1

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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


nnoremap <C-p> :FZF<CR>
map <silent> <F2> :NERDTreeToggle %:p:h<CR>
"map <silent> <F2> :NvimTreeToggle <CR>
set clipboard+=unnamedplus

set completeopt=longest,menuone,preview

set shiftwidth=4
set tabstop=4
set expandtab

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype tsx setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

autocmd Filetype cpp setlocal ts=3 sts=3 sw=3
autocmd Filetype hpp setlocal ts=3 sts=3 sw=3


nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Ignor fiels
let g:NERDTreeWinSize=30
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'npm-debug.log*', '\.*.gch.tmp', 'ghostdriver.log']
set completeopt-=preview

" Поиск по тексту

nnoremap <C-h> :Ag<CR>
nnoremap <C-m> :Marks<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


nnoremap <F3> :set hlsearch!<CR>

"Keep cursor when open file again
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=240


" TAB AUTOCOMPLETE

inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" otuer plugin b

"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#confirm():
"      \ "\<C-y>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


"lua << EOF
"require('Comment').setup()
"EOF

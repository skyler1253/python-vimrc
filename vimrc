"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'benmills/vimux'
    Plugin 'greghor/vim-pyShell'
    Plugin 'julienr/vim-cellmode'

    "-------------------=== Other ===-------------------------------
    Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    Plugin 'valloric/youcompleteme'
    " Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }            " Autocomplete plugin 

    "-------------------=== Python  ===-----------------------------
    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    " Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
    Plugin 'dense-analysis/ale'
    Plugin 'jeetsukumaran/vim-pythonsense'      "provides some Python-specific text objects: classes, functions, etc
    Plugin 'jiangmiao/auto-pairs'               "inserts closing quotes and parenthesis as you type
    
call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jk <Esc>
let mapleader = " "
set encoding=utf-8

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
" nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#left_alt_sep = '|'

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python3'
" let g:syntastic_python_python_exec='python3'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=1

" virtualenv
let g:pymode_virtualenv=1


" breakpoints
let g:pymode_breakpoint=0
let g:pymode_breakpoint_key='<Leader>vb'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%121v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=120
augroup END

" code folding
let g:pymode_folding=0
nnoremap <.> za
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" ale formatting
let g:ale_linters = {
      \   'python': ['flake8'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['black'],
      \}
nmap <F8> :ALEFix<CR>
let g:ale_fix_on_save = 1

let g:ale_python_flake8_options = '--max-line-length=120'


" syntastic
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_enable_signs=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_aggregate_errors=1
" let g:syntastic_loc_list_height=5
" let g:syntastic_error_symbol='X'
" let g:syntastic_style_error_symbol='X'
" let g:syntastic_warning_symbol='x'
" let g:syntastic_style_warning_symbol='x'
" let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>


" Skyler imports
set rtp+=/usr/local/opt/fzf

map <C-t> :NERDTreeToggle<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>b :ls<CR>:b<Space>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Inspect runner pane

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

map <Leader>fj :%!python -m json.tool<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"

" nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_imp    ulse_multiplier * winheight(0) * 2)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_imp    ulse_multiplier * winheight(0) * -2)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_imp    ulse_multiplier * winheight(0) * 4)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_imp    ulse_multiplier * winheight(0) * -4)<CR>

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
                                                                               
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" vim cell-mode parameters
let g:cellmode_use_tmux=1
let g:cellmode_tmux_panenumber=1

" ipython-shell
noremap ,ss :call StartPyShell()<CR>
noremap ,sk :call StopPyShell()<CR>

" code execution
nnoremap ,l  :call PyShellSendLine()<CR>
noremap <silent> <C-b> :call RunTmuxPythonCell(0)<CR>
noremap <C-a> :call RunTmuxPythonAllCellsAbove()<CR>

" code inspection
nnoremap ,sl :call PyShellSendKey("len(<C-R><C-W>)\r")<CR><Esc>
nnoremap ,sc :call PyShellSendKey("<C-R><C-W>.count()\r")<CR><Esc>
nnoremap ,so :call PyShellSendKey("<C-R><C-W>\r")<CR><Esc>
vnoremap ,so y:call PyShellSendKey(substitute('<C-R>0',"\"","\\\"","")."\r")<CR> 

" on data frames
nnoremap ,sdh :call PyShellSendKey("<C-R><C-W>.head()\r")<CR><Esc>
nnoremap ,sdc :call PyShellSendKey("<C-R><C-W>.columns\r")<CR><Esc>
nnoremap ,sdi :call PyShellSendKey("<C-R><C-W>.info()\r")<CR><Esc>
nnoremap ,sdd :call PyShellSendKey("<C-R><C-W>.describe()\r")<CR><Esc>
nnoremap ,sdt :call PyShellSendKey("<C-R><C-W>.dtypes\r")<CR><Esc>

" plot
nnoremap ,spp :call PyShellSendKey("<C-R><C-W>.plot()\r")<CR><Esc>
nnoremap ,sph :call PyShellSendKey("<C-R><C-W>.hist()\r")<CR><Esc>
nnoremap ,spc :call PyShellSendKey("plt.close('all')\r")<CR><Esc>

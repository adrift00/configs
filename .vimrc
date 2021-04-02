"set no compatible to vi 
set nocompatible

" set encodeing firstly, to avoid incorrect in message box
if has('multi_byte')
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

" enable number
set number    

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

set autochdir

set clipboard=unnamed,unnamedplus

" Turn on the Wild menu
set wildmenu

" Turn on the mouse in all mode
" If mouse mode is turned on in vim, "paste on right click" will cause some errors.
" set mouse=a

"
set ttyfast

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测，在有tmux是设置为20，因为外层已经有tmux的超时检测，而tmux和vim是本地通信，不用太长的超时检测，
" 如果在本机或网络环境下使用vim，超时设置为50，因为可能存在网络延迟的问题
if $TMUX != ''
    set ttimeoutlen=20
elseif &ttimeoutlen >50 ||&ttimeoutlen<=0
    set ttimeoutlen=50
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Enable syntax highlighting
syntax enable 
syntax on

" 
set t_Co=256

" Set colorscheme match to neovim
colorscheme ron

" Enables 24-bit RGB color
"if has("termguicolors")
"    set termguicolors
"endif 
"
" let g:python_host_prog = expand('~/miniconda3/bin/python')
" let g:python3_host_prog = expand('~/miniconda3/bin/python')

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guifont=YaHei\ Consolas\ Hybrid:h10
    set lines=25 columns=120
    set guioptions-=e
    set guitablabel=%M\ %t
    " Make the menu content correct
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Change the encode of message
    set langmenu=zh_CN.UTF-8
    language messages zh_CN.utf-8
endif

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Always show the status line
set laststatus=1 " never show 

" Personal keymaps
noremap J 5j
noremap K 5k
noremap <c-j> J    
noremap <c-k> K    
nnoremap < <<
nnoremap > >>
" This will cause the vim into replace mode automaticly when enter the vim, so comment it now.
"if maparg('<esc>', 'n') ==# ''
"  nnoremap <silent> <esc> <esc><esc>:noh<cr>
"  "nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"endif

let mapleader=' '
noremap gb <c-o>

" change the behaver when use Vex
let g:netrw_browse_split = 4    
let g:netrw_liststyle = 3    
let g:netrw_banner = 0    
let g:netrw_winsize = 15    
"augroup projectdrawer    "  autocmd!    
"  autocmd vimenter * :vexplore    
"augroup end

" change the cursor shape in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


" 防止tmux下vim的背景色显示异常 Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" 光标回到上次编辑的位置
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'davidhalter/jedi-vim', { 'for': 'python'}

Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()


" Configs for nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
noremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Configs for easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)


" jedi vim
let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "gh"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "F2"
let g:jedi#completions_enabled = 1
let g:jedi#show_call_signatures = "1"
" let g:jedi#popup_on_dot = 0

autocmd FileType python setlocal completeopt-=preview



" style settings

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
hi Pmenu ctermfg=black ctermbg=gray  guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff


"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
	if exists('##TerminalOpen')
		augroup VimUnixTerminalGroup
			au! 
			au TerminalOpen * setlocal nonumber signcolumn=no
		augroup END
	endif
endif


"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END


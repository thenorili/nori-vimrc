filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim
call vundle#begin()

Plugin 'https://github.com/scrooloose/nerdcommenter.git'

Plugin 'https://github.com/scrooloose/nerdtree.git'

Plugin 'https://github.com/godlygeek/tabular.git'

Plugin 'https://github.com/plasticboy/vim-markdown.git'

Plugin 'https://github.com/tpope/vim-fugitive.git'

Plugin 'https://github.com/christoomey/vim-conflicted.git'

Plugin 'https://github.com/flazz/vim-colorschemes.git'

Plugin 'https://github.com/felixhummel/setcolors.vim.git'

Plugin 'https://github.com/Yggdroot/indentLine.git'

Plugin 'https://github.com/vimoutliner/VimOutliner.git'

Plugin 'edkolev/tmuxline.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'inkarkat/vim-ingo-library'

Plugin 'inkarkat/vim-DeleteTrailingWhitespace'

Plugin 'mhinz/vim-signify'

Plugin 'https://github.com/thenorili/gtags-cscope.vim.git'

Plugin 'neoclide/coc.nvim'

Plugin 'https://github.com/dag/vim-fish.git'

Plugin 'https://github.com/junegunn/fzf.git'

Plugin 'https://github.com/ojroques/vim-oscyank.git'

Plugin 'https://github.com/airblade/vim-gitgutter'

Plugin 'https://github.com/kyazdani42/nvim-web-devicons'
Plugin 'https://github.com/nvim-lua/plenary.nvim'
Plugin 'https://github.com/sindrets/diffview.nvim'

call vundle#end()

filetype plugin indent on

syntax enable

set background=dark


" -- Misc



" Highlight past column 80
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 75)

" Enables 256 color mode over SSH
set t_Co=256

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Sets up invisibles, off by default; toggle with f3
" :set listchars=tab:→\,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set listchars=tab:·⁖,trail:¶

set noswapfile

set autowrite





" -- Search


" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Turns on incremental search
set incsearch





" -- Tab

set expandtab	      	"Turns \t into \s
set tabstop=3	      	"Turns \t into 2 spaces
set shiftwidth=3    	"Turns indentation into 2 spaces
set cindent
set autoindent

" -- Mappings

" Move a line of text using ALT-[jk]
nmap <m-j> mz:m+<cr>`z
nmap <m-k> mz:m-2<cr>`z
vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z


" F3: Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>

" <gf> defaults to creating new file when none can be found
:map gf :e <cfile><CR>





" -- Number width


set ruler             "Always show current position
set number	        	"Line numbering is on by default and relnum is off
set numberwidth=4   	"Line number width

function TRelative()	"This function toggles relative line numbering
	set relativenumber!
endfunc

function TNumber()  	"This function toggles line numbering
	set number!
endfunc


" Maps RLN toggle to \-r
map <LEADER>r :call TRelative()<cr>

" Maps LN toggle to \t
map <LEADER>t :call TNumber()<cr>





" -- Commenting


" Maps \[ to an open comment horizontal ruler
" map <Leader>[ i/*<Return> *----------------------------------------------------------------------<ESC>

" Maps \] to a close comment horizontal ruler
" map <Leader>] i *----------------------------------------------------------------------<Return> */<ESC>





" -- NerdCommenter


" Adds one space after comment delimiters
let g:NERDSpaceDelims = 1

" Aligns line-wise comment delimiters to the left
let g:NERDDefaultAlign = 'left'

" Allows commenting empty lines
let g:NERDCommentEmptyLines = 1

" NERDCommenterToggle checks if selection is commented
let g:NERDToggleCheckAllLines = 1

" -- NERDTree

let NERDTreeShowHidden=1                " show dot files in NERDtree

  " opens NERDTree when opening vim with no argument or directory as argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

  " toggles NERDTree with ctrl-n
map <c-n> :NERDTreeToggle<CR>

set ls=2
set statusline=%F%m%r%h%w\ \ \ Line:\ %4l\ /\ %-4L\ \ \ Column:\ %-3v\ \ %p%%

let g:DeleteTrailingWhitespace=1
let g:DeleteTrailingWhitespace_Action='delete'

set nobackup
" set backupdir=$DBC_HOME/tmp/vim/backup
set dir=$DBC_HOME/tmp/vim/swap

set tags=tags;/

set csprg=gtags-cscope
set cscopetag
let GtagsCscope_Auto_Load=0
let GtagsCscope_Keep_Alive=1
"nmap <LEADER>g <Esc>:!gtags<cr>:cs reset<cr>:GtagsCscope<cr>

" colorscheme murphy
" colorscheme torte

let g:airline_powerline_fonts = 1      " enable powerline symbols
let g:airline_theme='powerlineish'      " set airline theme

let g:ycm_use_clangd = 0


" Shortcut for OSCYank to send text selected in visual mode to the host
" clipboard
vnoremap <leader>c :OSCYank<CR>

" Clipboard overrides for system-clipboard integration and SSH-TMUX-Forwarding
" copy the current text selection to the system clipboard
" if has('gui_running') || has('nvim') && exists('$DISPLAY')
"   noremap <Leader>c "+y
" else
"   " copy to attached terminal using the yank(1) script:
"   " https://github.com/sunaku/home/blob/master/bin/yank
"   noremap <silent> <Leader>c y:call system('yank > /dev/tty', @0)<Return>
" endif


" Terminal mode remappings
" Esc key should return you to normal mode
tnoremap <ESC> <C-\><C-n>
" C-v Esc should send a "verbatim esc" to the terminal
tnoremap <C-v><Esc> <Esc>

" Ctrl-P should open FZF it exists
nnoremap <C-p> :FZF<CR>
nmap <M-h> gT
nmap <M-l> gt

" enable ripgrep searches with :grep, :cnext/:cprevious, :copen/:cclose
" TODO: map the quickfix commands
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

" Default to !read-only in vimdiff
set noro

function SaveAndMake()
   write
   execute 'make debug'
endfunc

command! W call SaveAndMake()

nnoremap <M-m> :W<CR>

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

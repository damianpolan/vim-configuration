" 
" THIS MUST COME FIRST:
map <SPACE> <leader>
" let mapleader = "\<Space>"

"Always show vim tab
:set showtabline=2

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>n :tabe<cr>

" Remove json conceal quotes as per https://stackoverflow.com/questions/40601818/vim-displays-json-file-without-any-quotes
let g:indentLine_setConceal = 0

" remap annoying tab duplication command
nnoremap <C-Bslash> ""

" remap :W to :w when its accidentally sent
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <leader>` :exe "tabn ".g:lasttab<cr>
vnoremap <leader>` :exe "tabn ".g:lasttab<cr>

"leader + ] goto definition in new tab
:nmap <leader>] <C-w><C-]><C-w>T

" neovim disable permanent search highlight
:set nohlsearch

" character limit
:set synmaxcol=120

" default copy buffer to system copy buffer
:set clipboard=unnamedplus

" remap ctag so it lists options if there are multiple matches
nnoremap <C-]> g<C-]>
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" set break indent so that lines exceeding a certain character count will wrap
" niceley
:set breakindentopt=shift:2
:set breakindent

" windows spliting

:nmap <leader>v :vsplit<enter>:FZF -i<enter>
:nmap <leader>h :split<enter>:FZF -i<enter>

" NERDTree mapping

:nmap <leader>t :NERDTreeFind<enter> <C-h>

" remap delete keys
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
xnoremap p "_dP
xnoremap P "_dp
xnoremap s "_s
nnoremap s "_s
nnoremap c "_c
nnoremap C "_C

" map :FZF binding

let $FZF_DEFAULT_COMMAND = 'ag --ignore-case --hidden --ignore .git -l -g ""' " allow search hidden files and folders
:nmap <leader>f :Files<enter>
:nmap <leader>d :Lines<enter>

" gbrowse
:nmap <leader>i :.Gbrowse<enter>

"line indentation markers
" let g:indentLine_setColors = 0

" use jj as eskape key
:imap jk <Esc>

" Keep cursor centred on screen:
:set scrolloff=5
:set so=999

" configure vim gitgutter https://stackoverflow.com/questions/6821033/vim-how-to-run-a-command-immediately-when-starting-vim
"Has autocmd bug if no .git file exists.
" autocmd VimEnter * GitGutterEnable 

" map :FZF
" nnoremap <C-P> :FZF<CR>

" Shortcut key for copying the filepath of the current open file  
" nmap <C-G> :let @*=expand("%:p")<CR>:echo 'Filepath copied.'<CR>
nmap <leader>g :let @*=expand("%:p")<CR>:echo 'Filepath copied.'<CR>

" Automatically reload vimrc file
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


" Remap split navigation to ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


" Auto generate ctags (szw/vim-tags)
let g:vim_tags_auto_generate = 0

" CTAGS:  https://blog.sensible.io/2014/05/09/supercharge-your-vim-into-ide-with-ctags.html

" auto generate ctags on write
" autocmd BufWritePost * !tags -R --languages=ruby --exclude=.git --exclude=log .
 

" Auto refresh files not modified by vim
set autoread

" File name on terminal tab
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")             
set title

" file  path always visible
set statusline=%t

" Configure tab spaces
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

" Fixes bug where new tabs don't get indentation settings
autocmd FileType * set tabstop=2 shiftwidth=2 expandtab backspace=indent,eol,start

" autocmd BufReadCmd au_test echo 'EYY'

" Line Numbers always on
set number
" set number relativenumber
" augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" Syntax highlight always on
syntax on


" Autostart NERDTree
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1


" SETUP FOR VUNDLE


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" TO INSTALL NEW PACKAGE: run :PluginInstall


Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
"Plugin 'gabesoft/vim-ags'
Plugin 'tpope/vim-rails'
Plugin 'djoshea/vim-autoread' " Auto read files when they change

" Silver searcher plugins:
Plugin 'mileszs/ack.vim'
"let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:ackprg = 'ag --vimgrep'
"let g:ackprg = 'ag --ignore-case --hidden --ignore'


Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'szw/vim-tags'
Plugin 'mg979/vim-visual-multi' " multi cursor
" Plugin 'vim-gitgutter' " buggy when not a git repo
Plugin 'mhinz/vim-signify' " replaces gitgutter
Plugin 'ruanyl/vim-gh-line'
Plugin 'Yggdroot/indentLine' "thin vertical lines for indentation
Plugin 'tpope/vim-fugitive' "Gbrowse
Plugin 'tpope/vim-rhubarb' "enables Gbrowse
Plugin 'vim-airline/vim-airline' "Status tabline at the bottom

"Plugin 'zxqfl/tabnine-vim' " AI autocompletion

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"<Paste>

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'


" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype on
filetype plugin on
filetype indent on
set autoindent
set smartindent

set nopaste " sometimes we unexpectedly enter paste mode, which stop deoplete and autoindent from working. This resets it

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF - OPTIONS

set rtp+=/usr/local/opt/fzf

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
"let g:fzf_layout = { 'down': '~60%' }
" preview_window at top
"let g:fzf_preview_window = { 'up': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




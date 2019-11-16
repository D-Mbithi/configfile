call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'

Plug 'davidhalter/jedi-vim'

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

Plug 'machakann/vim-highlightedyank'

Plug 'tmhedberg/SimpylFold'

Plug 'morhetz/gruvbox'

Plug 'mattn/emmet-vim'

call plug#end()



" General Configurations
"--------------------------------
let mapleader=","       " Map leader
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline


" Deoplete settings
" -------------------------------
let g:deoplete#enable_at_startup = 1


" Configure jedi
" ------------------------------
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif "auto close info window

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Nerdcommenter configure
" ------------------------------
let g:NERDSpaceDelims = 1 " add single space after comment
let g:NERDTrimTrailingWhitespace = 1 " remove trailing space
let g:NERDToggleCheckAllLines = 1

" Neoformat Config
" ------------------------------
let g:neoformat_basic_format_align = 1  " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace


" Jedi-vim Config for Class jump
" --------------------------------
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer

" Configure Pylint
" -------------------------------
let g:neomake_python_enabled_makers = ['pylint']


" NerdTree Config
" -------------------------------
" nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']


" Color scheme configure
" --------------------------------
colorscheme gruvbox

set background=dark " use dark mode
" set background=light " uncomment to use light mode



" Tell Vim which characters to show for expanded TABs,
" -----------------------------------------------------

" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

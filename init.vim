" Basic Settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus
set wildmenu
set wildmode=longest,list,full
set cursorline
set encoding=UTF-8

" Plugin Management
call plug#begin()

Plug 'nvim-tree/nvim-web-devicons'          " File icons
Plug 'romgrk/barbar.nvim'                   " Tab bar
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Syntax highlighting
Plug 'http://github.com/tpope/vim-surround' " Text surrounding
Plug 'https://github.com/preservim/nerdtree' " File explorer
Plug 'https://github.com/tpope/vim-commentary' " Comment toggling
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color'  " CSS color preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Colorschemes
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Autocompletion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder
Plug 'junegunn/fzf.vim'                     " FZF Vim integration
Plug 'tpope/vim-fugitive'                   " Git integration
Plug 'Yggdroot/indentLine'                  " Indent guides
Plug 'zbirenbaum/copilot.lua'               " GitHub Copilot
Plug 'nvim-lua/plenary.nvim'                " Copilot dependency

call plug#end()

" Leader Key
let mapleader = ","

" Keybindings
nnoremap <C-z> u                            " Undo
nnoremap <C-y> <C-r>                        " Redo
nnoremap <C-s> :w<CR>                       " Save
vnoremap <C-c> "+y                          " Copy
nnoremap <C-p> "+p                          " Paste
vnoremap <C-p> p                            " Paste in visual mode
nnoremap <leader>t :terminal<CR>            " Open terminal
nnoremap <C-f> :NERDTreeFocus<CR>           " Focus NERDTree
nnoremap <C-n> :NERDTree<CR>                " Open NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>          " Toggle NERDTree
nnoremap <leader>d :call CocActionAsync('jumpDefinition')<CR>  " Go to definition
nnoremap <C-p> :FZF<CR>                     " Fuzzy file search
nnoremap <C-/> :Commentary<CR>              " Toggle comment

" Colorscheme
colorscheme jellybeans

" Airline Configuration
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" CoC Configuration
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Copilot Configuration
lua << EOF
require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<M-Enter>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    ["*"] = true,
  },
})
EOF

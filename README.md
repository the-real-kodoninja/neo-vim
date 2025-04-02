# Neovim Configuration: VSCode-like Experience with AI-Powered Coding

This Neovim configuration is designed to emulate Visual Studio Code (VSCode) with powerful AI features like GitHub Copilot. It provides a modern UI, file explorer, autocompletion, and keybindings familiar to VSCode users, enhanced with intelligent AI code suggestions.

## ✨ Features

* **AI Integration:** GitHub Copilot for intelligent code suggestions and generation.
* **File Explorer:** NERDTree for browsing files like VSCode’s sidebar.
* **Autocompletion:** coc.nvim for IntelliSense-like completions, with optional AI enhancements.
* **Syntax Highlighting:** nvim-treesitter for accurate, modern code parsing.
* **Status Bar:** vim-airline with powerline fonts for a sleek look.
* **Tabs:** barbar.nvim for a tabbed interface.
* **Fuzzy Finder:** fzf.vim for quick file and command searching.
* **Git Support:** vim-fugitive for Git integration.
* **VSCode-like Keybindings:** Ctrl+S to save, Ctrl+Z to undo, Ctrl+P to paste, etc.

## 🛠️ Prerequisites

* **Neovim:** Version 0.5.0 or higher (install via `brew install neovim` on macOS, `sudo apt install neovim` on Ubuntu, or check [Neovim releases](https://github.com/neovim/neovim/releases)).
* **Node.js:** Required for coc.nvim (install via `brew install node` or `sudo apt install nodejs npm`).
* **Git:** For plugin management (usually pre-installed; check with `git --version`).
* **GitHub Copilot Subscription:** Required for Copilot integration (sign up at [GitHub Copilot](https://github.com/features/copilot)).
* **Terminal with Nerd Fonts:** For icons (e.g., install FiraCode Nerd Font and set it in your terminal).

## 📦 Installation

1.  **Set Up Neovim Config:**

    * **Locate Config Directory:**
        * On Linux/macOS: `~/.config/nvim/`
        * On Windows: `~/AppData/Local/nvim/`
    * Create it if it doesn’t exist: `mkdir -p ~/.config/nvim`
    * Create `init.vim`: Copy the configuration below into `~/.config/nvim/init.vim`:

    ```vim
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
    Plug '[http://github.com/tpope/vim-surround](http://github.com/tpope/vim-surround)' " Text surrounding
    Plug '[https://github.com/preservim/nerdtree](https://github.com/preservim/nerdtree)' " File explorer
    Plug '[https://github.com/tpope/vim-commentary](https://github.com/tpope/vim-commentary)' " Comment toggling
    Plug '[https://github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)' " Status bar
    Plug '[https://github.com/ap/vim-css-color](https://github.com/ap/vim-css-color)'  " CSS color preview
    Plug '[https://github.com/rafi/awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes)' " Colorschemes
    Plug '[https://github.com/neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)', {'branch': 'release'}  " Autocompletion
    Plug '[https://github.com/ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)' " Developer icons
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
    ```

    * Save the file.

2.  **Install Plugins:**

    * Open Neovim: Run `nvim` in your terminal.
    * Install Plugins: Type `:PlugInstall` and press Enter. Wait for all plugins to download and install.
    * Update Treesitter: Run `:TSUpdate` to install syntax highlighting parsers.
    * Exit and Reopen: Type `:qa` to quit, then reopen Neovim with `nvim`.

3.  **Install AI Features (GitHub Copilot):**

    * Verify Prerequisites: Ensure Node.js and a GitHub Copilot subscription are set up.
    * Authenticate Copilot:
        * In Neovim, run `:Copilot setup`.
        * Follow the prompts to log in to GitHub and authorize Copilot.
        * Check status with `:Copilot status` (should say "Enabled").
    * Test Copilot:
        * Open a file (e.g., `nvim main.py`).
        * Type a comment like `# Add two numbers` and wait for Copilot to suggest code.
        * Press Alt+Enter (`<M-Enter>`) to accept suggestions.

4.  **Optional AI Enhancement: coc-tabnine:**

    * If you prefer a lighter AI or don’t have a Copilot subscription:
        * Run `:CocInstall coc-tabnine` in Neovim.
        * It integrates with coc.nvim and provides AI completions automatically.

## 🧑‍💻 How to Use Neovim

### Basic Vim/Neovim Modes

* **Normal Mode:** Default mode for navigation and commands (press Esc to enter).
* **Insert Mode:** For typing code (press `i` to enter, Esc to exit).
* **Visual Mode:** For selecting text (press `v` to enter, Esc to exit).
* **Command Mode:** For running commands (press `:` from Normal mode).

### Common Controls

* **Navigation:**
    * `h, j, k, l`: Move left, down, up, right.
    * `w`: Jump to next word.
    * `b`: Jump to previous word.
    * `gg`: Go to top of file.
    * `G`: Go to bottom of file.
    * `:<number>`: Go to line number (e.g., `:10`).
* **Editing:**
    * `i`: Insert before cursor.
    * `a`: Insert after cursor.
    * `o`: New line below.
    * `O`: New line above.
    * `dd`: Delete line.
    * `yy`: Copy line.
    * `p`: Paste below.
    * `u`: Undo (Ctrl+Z also works).
    * `<C-r>`: Redo (Ctrl+Y also works).
* **File Management:**
    * `:w`: Save (Ctrl+S also works).
    * `:q`: Quit.
    * `:wq`: Save and quit.
    * `:q!`: Quit without saving.

### Custom Keybindings

* Ctrl+S: Save file.
* Ctrl+Z: Undo.
* Ctrl+Y: Redo.
* Ctrl+C: Copy selected text (Visual mode).
* Ctrl+P: Paste (Normal mode) or fuzzy file search.
* Ctrl+F: Focus NERDTree.
* Ctrl+N: Open NERDTree.
* Ctrl+T: Toggle NERDTree.
* Ctrl+/: Toggle comment.
* `,t`: Open terminal.
* `,d`: Jump to definition (via coc.nvim).
* Alt+Enter: Accept Copilot suggestion.
* Alt+]: Next Copilot suggestion.
* Alt+[: Previous Copilot suggestion.
* Ctrl+]: Dismiss Copilot suggestion.

### AI Usage

* **Copilot:** Type code or comments (e.g., `# Sort a list`), and suggestions appear inline. Use Alt+Enter to accept.
* **CoC:** Press Tab to cycle through autocompletion suggestions when the popup appears.

### Plugins

* **NERDTree:** File explorer (Ctrl+T to toggle).
* **FZF:** Search files with Ctrl+P.
* **Commentary:** Comment lines with Ctrl+/.
* **Barbar:** Switch tabs with `:BufferNext` (or `:bn`) and `:BufferPrevious` (or `:bp`).

### Exiting Neovim

* `:q`: Quit if no changes.
* `:qa`: Quit all buffers.
* `:wqa`: Save and quit all.

### Troubleshooting

* **Plugins Not Loading:** Run `:PlugClean` then `:PlugInstall`.
* **Copilot Not Working:** Check `:Copilot status` and ensure authentication.
* **No Icons:** Install a Nerd Font and set it in your terminal.
* **CoC Errors:** Run `:CocInfo` for diagnostics.

### Customization

* Change the colorscheme: Replace `jellybeans` with another from [awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes) (e.g., `gruvbox`).
* Add language servers: `:CocInstall coc-python` for Python, `:CocInstall coc-json` for JSON, etc.

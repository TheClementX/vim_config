:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color' 
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/KarimElghamry/vim-auto-comment'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/907th/vim-auto-save'
Plug 'https://github.com/rose-pine/neovim' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()

" treesitter configuration
" this block of code runs treesitter config in lua through vimscript
" simply add module and set enable = true
lua <<EOF
require'nvim-treesitter.configs'.setup {


  auto_install = true,


  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },


  highlight = {
	  enable = true, 
  },


}
EOF

" end of treesitter declaration

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"] " enable autosave on changes
let g:default_inline_comment = '#'

:colorscheme jellybeans

nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-l> :Telescope find_files<CR>
nnoremap <C-\> :ToggleTerm<CR>


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

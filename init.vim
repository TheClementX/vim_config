"set nvim preferences
:set number relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:filetype plugin on 
let mapleader = " " 

"install plugins
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' "status line 
Plug 'https://github.com/preservim/nerdtree' "file explorer
Plug 'https://github.com/rafi/awesome-vim-colorschemes' "color schemes
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "multiple cursors
Plug 'https://github.com/KarimElghamry/vim-auto-comment' "auto comment
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "syntax highlighting
Plug 'https://github.com/907th/vim-auto-save' "autosave
Plug 'nvim-lua/plenary.nvim' "telescope dependency 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } "fuzzy finder
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' "indent lines
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
Plug 'davidgranstrom/scnvim' "SuperCollider 

call plug#end()

" treesitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {

  --auto update languages
  auto_install = true,

  --enable incremental selection
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

"indent line config
lua <<EOF
require("ibl").setup()
EOF

"SuperCollider Config
lua << EOF
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

require'scnvim'.setup({
  keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = map('sclang.start'),
    ['<leader>sk'] = map('sclang.recompile'),
    ['<F1>'] = map_expr('s.boot'),
    ['<F2>'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
    },
  },
  postwin = {
    float = {
      enabled = true,
    },
  },
})
EOF

"auto save setup
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"] " enable autosave on changes
let g:default_inline_comment = '#'

"set colorschem
:colorscheme jellybeans

"keybines for commands
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-l> :Telescope find_files<CR>
nnoremap <C-\> :terminal<CR>
nnoremap <C-s> :SCNvimStart<CR>


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"set nvim preferences
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

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

call plug#end()

" treesitter configuration
lua <<EOF
--use lua <<EOF code EOF to run lua setup in vim script
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

  --enable highlight
  highlight = {
	  enable = true, 
  },
}
EOF
"end of treesitter declaration

"indent line config
lua <<EOF
require("ibl").setup()
EOF
"end indent line config

"auto save setup
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"] " enable autosave on changes
let g:default_inline_comment = '#'

"set colorschem
:colorscheme jellybeans

nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-l> :Telescope find_files<CR>
nnoremap <C-\> :terminal<CR>


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

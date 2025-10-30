local opt = vim.opt

vim.g.mapleader = " "

opt.numberwidth = 4
opt.signcolumn = "yes:1"

opt.splitright = true
opt.nu = true
opt.relativenumber = true
opt.termguicolors = true

opt.mousescroll = "ver:2,hor:6"

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

opt.tabstop = 4
opt.synmaxcol = 250
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 4

opt.updatetime = 50

vim.g.disable_autoformat = false

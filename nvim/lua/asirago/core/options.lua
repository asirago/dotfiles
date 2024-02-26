vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.mousescroll = "ver:2,hor:6"

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

vim.opt.tabstop = 4
vim.opt.synmaxcol = 250
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 4

vim.opt.updatetime = 50

vim.g.mapleader = " "

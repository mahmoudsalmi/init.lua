local _, os_name = require("salmidev.utils").os_name()
if os_name == "nixos" then
  vim.opt.shell = "/run/current-system/sw/bin/zsh"
end
-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

local tabstop = 2
vim.opt.tabstop = tabstop
vim.opt.softtabstop = tabstop
vim.opt.shiftwidth = tabstop
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.foldcolumn = "0"

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.foldtext = ""

vim.opt.foldnestmax = 4


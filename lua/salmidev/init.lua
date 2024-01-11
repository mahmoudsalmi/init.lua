require("salmidev.set")
require("salmidev.remap")
require("salmidev.lazy-init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function R(name)
  require("plenary.reload").reload_module(name)
end

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 60,
    })
  end,
})

-- local SalmiDevGroup = augroup('SalmiDev', {})
-- autocmd({"BufWritePre"}, {
--   group = SalmiDevGroup,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


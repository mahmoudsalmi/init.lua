return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        sign_priority = 6,
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

      local SalmiDev_Fugitive = vim.api.nvim_create_augroup("SalmiDev_Fugitive", {})

      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = SalmiDev_Fugitive,
        pattern = "*",
        callback = function()
          if vim.bo.ft ~= "fugitive" then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set("n", "<leader>p", ":Git push<CR>", opts)

          -- rebase always
          vim.keymap.set("n", "<leader>P", ":Git pull --rebase<CR>", opts)

          -- NOTE: It allows me to easily set the branch i am pushing and any tracking
          -- needed if i did not set the branch up correctly
          vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
        end,
      })
    end
  }
}

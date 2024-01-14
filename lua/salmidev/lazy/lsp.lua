return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'lua_ls'
      },
      handlers = {
        function(server_name)
          local lsp_server = require("lspconfig")[server_name]
          local opts = {}

          if server_name == 'rust_analyzer' then
            if vim.loop.os_uname().version:lower():match('nixos') then
              opts.cmd = { os.getenv('HOME') .. '/.nix-profile/bin/rust-analyzer' }
            end
          end
          lsp_server.setup(opts)
        end,
      }
    })
  end
}

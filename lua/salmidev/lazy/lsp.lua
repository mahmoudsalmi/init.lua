return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    local cmp = require("cmp")
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local lspconfig = require("lspconfig")

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }
      )
    })

    require("fidget").setup()
    require("mason").setup({
      PATH = "skip",
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'lua_ls'
      },
      handlers = {
        function(server_name)
          local opts = {
            capabilities = require("cmp_nvim_lsp").default_capabilities()
          }
          lspconfig[server_name].setup(opts)
        end,
        ["lua_ls"] = function ()
          lspconfig.lua_ls.setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
      },
    })

    vim.diagnostic.config({ virtual_text = true })
  end
}

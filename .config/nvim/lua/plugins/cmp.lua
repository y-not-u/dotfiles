return {
  {
    'hrsh7th/nvim-cmp',
    event = "VeryLazy",
    commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639", -- lock update (break codeium)
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function() end },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "path" },
          { name = "codeium" }
        }),
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Codeium = "", }
          })
        },
        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<Esc>'] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    }
  },
  {
    "jcdickinson/codeium.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true
  },
}

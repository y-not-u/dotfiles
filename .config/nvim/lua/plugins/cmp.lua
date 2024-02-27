return {
  {
    'hrsh7th/nvim-cmp',
    event = { "BufRead", "BufNewFile" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Codeium = "" },
            before = function(entry, vim_item)
              vim_item = require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
              return vim_item
            end
          }),
        },
        mapping = {
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
          ['<C-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<Esc>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "jcdickinson/codeium.nvim",
    }
  },
  -- vscode like icon
  {
    "onsails/lspkind.nvim",
  },

  {
    "Exafunction/codeium.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true
  },
}

return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter' },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "nvim_lua" },
          { name = "path" },
          { name = "buffer",  keyword_length = 3 },
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            symbol_map = { Codeium = "" },
            before = require("tailwind-tools.cmp").lspkind_format
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
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "Exafunction/codeium.nvim",
      "saadparwaiz1/cmp_luasnip",
    }
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    event = { 'InsertEnter' },
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      { "nvim-cmp" },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  -- vscode like icon
  {
    "onsails/lspkind.nvim",
  },
}

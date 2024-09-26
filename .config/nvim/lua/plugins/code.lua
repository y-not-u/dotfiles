return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    }
  },

  -- CSS colorize
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = "BufAdd",
    config = true
  },

  -- highlight colors
  {
    'echasnovski/mini.hipatterns',
    version = '*',
    enabled = false,
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        }
      })
    end
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "css", "javascript", "typescript", "typescriptreact", "typescriptreact" },
    opts = {
      document_color = {
        enabled = true, -- can be toggled by commands
        kind = "background", -- "inline" | "foreground" | "background"
        inline_symbol = "󰝤 ", -- only used in inline mode
        debounce = 500, -- in milliseconds, only applied in insert mode
      },
    }
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    enabled = false,
    lazy = true,
    event = "InsertEnter",
    config = true,
  },

  {
    'm4xshen/autoclose.nvim',
    config = true
  },

  -- auto tag
  {
    "windwp/nvim-ts-autotag",
    config = true,
    lazy = true,
    event = "BufAdd",
  },

  -- shiftwidth
  { "tpope/vim-sleuth" },

  -- formmater
  {
    'mhartington/formatter.nvim',
    config = function()
      require("formatter").setup {
        -- Enable or disable logging
        logging = false,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        filetype = {
          javascipt = { require('formatter.filetypes.javascript').prettier },
          javasciptreact = { require('formatter.filetypes.javascriptreact').prettier },
          typescript = { require('formatter.filetypes.typescript').prettier },
          typescriptreact = { require('formatter.filetypes.typescriptreact').prettier },
          css = { require('formatter.filetypes.css').prettier },
          scss = { require('formatter.filetypes.css').prettier },
          json = { require('formatter.filetypes.json').prettier },
          sh = { require('formatter.filetypes.sh').shfmt },

          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
            function()
              -- Ignore already configured types.
              local defined_types = require("formatter.config").values.filetype
              if defined_types[vim.bo.filetype] ~= nil then
                return nil
              end
              vim.lsp.buf.format({ async = true })
            end,
          }
        }
      }

      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup("__formatter__", { clear = true })
      autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
      })
    end,
    keys = {
      { "<leader>f", "<cmd>Format<CR>",      desc = "Format" },
      { "<leader>F", "<cmd>FormatWrite<CR>", desc = "Format and write" },
    }
  },

  -- generate annotations
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    cmd = { "Neogen" },
  },

  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    opts = {},
  }
}

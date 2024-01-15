return {
  -- comment
  {
    "danymat/neogen",
    config = true,
  },
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

  -- tailwindcss
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true
  },

  -- run jest
  {
    "mattkubej/jest.nvim",
    lazy = true,
    cmd = {
      "Jest",
      "JestFile",
      "JestSingle"
    }
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },

  -- auto tag
  {
    "windwp/nvim-ts-autotag",
    config = true,
    lazy = true,
    event = "BufAdd",
  },

  -- wakatime
  { "wakatime/vim-wakatime" },

  -- shiftwidth
  { "tpope/vim-sleuth" },

  -- formmater
  {
    'mhartington/formatter.nvim',
    config = function()
      require("formatter").setup {
        -- Enable or disable logging
        logging = true,
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
    end,
    keys = {
      { "<leader>F", "<cmd>FormatWrite<CR>", desc = "Format Write" },
    }
  }
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    }
  },
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "cssls",
        "tailwindcss",
        "marksman",
        "html",
        "eslint"
      }
    },
    dependencies = {
      "williamboman/mason.nvim"
    }
  },
  -- vscode like icon
  {
    "onsails/lspkind.nvim",
  },
  -- lsp ui
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = true,
    opts = {
      symbol_in_winbar = {
        enable = false
      },
      rename = {
        in_select = false,
        keys = {
          quit = '<Esc>'
        }
      },
      code_action = {
        show_server_name = true,
        keys = {
          quit = '<Esc>'
        }
      },
      definition = {
        quit = '<Esc>'
      }
    },
    keys = {
      { "K",  ":Lspsaga hover_doc<CR>",             desc = "Toggle hover doc" },
      { "<leader>o",  ":Lspsaga outline<CR>",               desc = "Toggle outline" },
      { "<leader>ca", ":Lspsaga code_action<CR>",           desc = "Code action" },
      { "<leader>do", ":Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics" },
      { "<leader>dd", ":Lspsaga show_buf_diagnostics<CR>",  desc = "Show diagnostics" },
      { "<leader>rn", ":Lspsaga rename<CR>",                desc = "Rename" },
      { "<leader>gd", ":Lspsaga goto_definition<CR>",       desc = "Goto definition" }
    },
  },
  -- AI
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  }
}

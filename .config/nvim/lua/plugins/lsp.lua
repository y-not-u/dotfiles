return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.marksman.setup {}
      lspconfig.eslint.setup {}
      lspconfig.html.setup {}
      lspconfig.cssls.setup {}
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
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
}

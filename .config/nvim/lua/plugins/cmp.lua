return {
  -- NULL LS
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "jcdickinson/codeium.nvim",
    config = function()
      require("codeium").setup({})
    end
  },
  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    config = function()
      local lsp = require("lsp-zero").preset({})
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)
      lsp.ensure_installed({
        'tsserver', -- js / ts
        'eslint',   -- js / ts
        'cssls',    -- css/less/scss
        'html',
        'tailwindcss',
        'volar',   -- vue
        'pyright', -- python
        'lua_ls',  -- lua
      })
      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })
      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['null-ls'] = {
            'html',
            'javascript', 'javascriptreact',
            'typescript', 'typescriptreact',
            'css', 'scss',
            'json',
          },
        }
      })

      lsp.setup()

      local cmp = require('cmp') -- Autocompletion
      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "codeium" }
        },
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Codeium = "", }
          })
        }
      })
    end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
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
      { "<leader>o",  ":Lspsaga outline<CR>",               desc = "Toggle outline" },
      { "<leader>ca", ":Lspsaga code_action<CR>",           desc = "Code action" },
      { "<leader>do", ":Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics" },
      { "<leader>dd", ":Lspsaga show_buf_diagnostics<CR>",  desc = "Show diagnostics" },
      { "<leader>gr", ":Lspsaga rename<CR>",                desc = "Rename" },
      { "<leader>gd", ":Lspsaga goto_definition<CR>",       desc = "Goto definition" }
    },
  },

}

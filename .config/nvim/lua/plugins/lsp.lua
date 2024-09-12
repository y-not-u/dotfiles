return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
      lspconfig.ts_ls.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.marksman.setup {}
      lspconfig.eslint.setup {}
      lspconfig.html.setup {}
      lspconfig.cssls.setup {}
      lspconfig.gopls.setup {}
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
        "ts_ls",
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

  -- LSP progress messages
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript",
          "typescript",
          "python",
          "tsx",
          "css",
          "scss",
          "json",
          "lua",
          "html",
          "toml",
          "yaml",
          "bash",
          "markdown",
          "markdown_inline",
          "vim",
          "dockerfile",
          "gitignore",
          "regex"
        },
        modules = {},
        ignore_install = { "java", "kotlin" },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end
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
      outline = {
        detail = false,
        close_after_jump = true,
        keys = {
          jump = '<CR>'
        }
      },
      definition = {
        quit = '<Esc>'
      }
    },
    keys = {
      { "K",          ":Lspsaga hover_doc<CR>",             desc = "Toggle hover doc" },
      -- { "<leader>o",  ":Lspsaga outline<CR>",               desc = "Toggle outline" },
      { "<leader>ca", ":Lspsaga code_action<CR>",           desc = "Code action" },
      { "<leader>rn", ":Lspsaga rename<CR>",                desc = "Rename" },
      { "<leader>do", ":Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics" },
      { "<leader>dd", ":Lspsaga show_buf_diagnostics<CR>",  desc = "Show diagnostics" },
      { "<leader>gd", ":Lspsaga goto_definition<CR>",       desc = "Goto definition" },
      { "<leader>gr", ":Lspsaga finder ref<CR>",            desc = "Show references" }
    },
  },

  -- outline
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        auto_close = true,
      },
      outline_items = {
        show_symbol_details = false
      },
      preview_window = {
        auto_preview = true
      }
    },
  },

  -- for neovim
  { "folke/neodev.nvim", opts = {} }
}

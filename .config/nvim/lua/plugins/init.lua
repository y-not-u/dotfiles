local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },                                                  -- show shortcuts
  { "folke/neoconf.nvim",          cmd = "Neoconf" }, -- unknown
  {
    cmd = "Telescope",                                -- find files
    keys = {
      { "<leader>f",  ":Telescope find_files<CR>", desc = "find files" },
      { "<leader>gs", ":Telescope git_status<CR>", desc = "status" },
    },
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    }
  },                         -- show indent
  {
    "numToStr/Comment.nvim", -- gcc comment
    -- lazy = true,
    config = function()
      require("Comment").setup()
    end,
    keys = {
      { "<C-\\>", "<Plug>(comment_toggle_linewise_current)", desc = "comment" },
    },
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },

  -- neo tree file explor
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        default_component_configs = {
          icon = {
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
          },
          git_status = {
            symbols = {
              renamed  = "󰁕",
              unstaged = "󰄱",
            },
          },
        },
        document_symbols = {
          kinds = {
            File = { icon = "󰈙", hl = "Tag" },
            Namespace = { icon = "󰌗", hl = "Include" },
            Package = { icon = "󰏖", hl = "Label" },
            Class = { icon = "󰌗", hl = "Include" },
            Property = { icon = "󰆧", hl = "@property" },
            Enum = { icon = "󰒻", hl = "@number" },
            Function = { icon = "󰊕", hl = "Function" },
            String = { icon = "󰀬", hl = "String" },
            Number = { icon = "󰎠", hl = "Number" },
            Array = { icon = "󰅪", hl = "Type" },
            Object = { icon = "󰅩", hl = "Type" },
            Key = { icon = "󰌋", hl = "" },
            Struct = { icon = "󰌗", hl = "Type" },
            Operator = { icon = "󰆕", hl = "Operator" },
            TypeParameter = { icon = "󰊄", hl = "Type" },
            StaticMethod = { icon = '󰠄 ', hl = 'Function' },
          }
        },
        -- Add this section only if you've configured source selector.
        source_selector = {
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
        -- Other options ...
      })
    end,
    lazy = true,
    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree action=focus toggle git_status reveal<CR>", desc = "file explor" }
    }
  },

  -- dashboard
  {
    'glepnir/dashboard-nvim', -- start dashboard
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end
  },

  -- fzf fuzzy find files and contents
  {
    "junegunn/fzf.vim",
    lazy = true,
    cmd = 'Rg',
    keys = {
      { "<leader>/", ":Rg<CR>", desc = "search contents" }
    },
    dependencies = { "junegunn/fzf" }
  },

  -- status bar
  {
    "vim-airline/vim-airline",
  },

  -- color scheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    config = function()
      require('rose-pine').setup({
        dim_nc_background = true,
        disable_background = true,
      })
    end
  },

  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gg", ":Neogit<CR>", desc = "Neogit" }
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
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
          "bash",
          "markdown",
          "vim",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },

  -- NULL LS
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end
  },

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
          ['null-ls'] = { 'html',
            'javascript', 'javascriptreact', 'javascript.jsx',
            'typescript', 'typescriptreact', 'typescript.tsx', 'tsx',
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
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },

  -- git status
  {
    "airblade/vim-gitgutter",
  },

  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- markdown preview need to build first
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "md"
  },

  -- lsp ui
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    lazy = true,
    keys = {
      { "<leader>o",  ":Lspsaga outline<CR>",     desc = "Toggle outline" },
      { "<C-e>",      ":Lspsaga term_toggle<CR>", desc = "Floating terminal" },
      { "<leader>ca", ":Lspsaga code_action<CR>", desc = "Code action" }
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  -- buffer
  {
    "akinsho/bufferline.nvim",
    config = function()
      require('bufferline').setup {
        options = {
          show_close_icon = false,
          show_buffer_close_icons = false,
          hover = { enabled = true, reveal = { 'close' } },
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
          end
        },
      }
    end,
    keys = {
      { "<leader>b[", ":bprev<CR>",                  desc = "buffer before" },
      { "<leader>b]", ":bnext<CR>",                  desc = "buffer next" },
      { "<leader>b1", ":BufferLineGoToBuffer 1<CR>", desc = "buffer 1" },
      { "<leader>b2", ":BufferLineGoToBuffer 2<CR>", desc = "buffer 2" },
      { "<leader>b3", ":BufferLineGoToBuffer 3<CR>", desc = "buffer 3" },
      { "<leader>b4", ":BufferLineGoToBuffer 4<CR>", desc = "buffer 4" },
      { "<leader>b5", ":BufferLineGoToBuffer 5<CR>", desc = "buffer 5" },
      { "<leader>b6", ":BufferLineGoToBuffer 6<CR>", desc = "buffer 6" },
      { "<leader>b7", ":BufferLineGoToBuffer 7<CR>", desc = "buffer 7" },
    }
  },
})

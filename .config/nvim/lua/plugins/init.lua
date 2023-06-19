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
  },

  -- lua function
  { 'nvim-lua/plenary.nvim' },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- search files
  {
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files no_ignore=true hidden=true<CR>", desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                               desc = "find and switch buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                             desc = "find and grep files" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG<CR>",       desc = "find and grep files" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🔍 ",
        file_ignore_patterns = {
          "node_modules", "build", "dist", "yarn.lock", ".git/"
        },
      },
      ripgrep_arguments = {
        'rg',
        '--hidden',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
    },
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
  },

  -- display indents
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "terminal", "text",
        "markdown", "git" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
      use_treesitter = true,
      show_first_indent_level = true,
    }
  },

  -- gcc comment
  {
    "numToStr/Comment.nvim",
    config = true,
    lazy = true,
    event = "BufRead",
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
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".git",
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
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
      })
    end,
    lazy = true,
    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree action=focus toggle reveal<CR>", desc = "file explor" }
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

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    config = true
  },

  -- todo
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = true
  },

  -- auto tag
  {
    "windwp/nvim-ts-autotag",
    config = true,
    lazy = true,
    event = "BufAdd",
  },

  -- color scheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        dim_nc_background = true,
        disable_background = true,
      })
      vim.cmd([[colorscheme rose-pine]])
    end
  },

  -- colorscheme for codes
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
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end
  },

  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "Toggle LazyGit" },
    }
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
    build = 'cd app && yarn install',
    ft = "markdown",
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
      { "<leader>o",  ":Lspsaga outline<CR>",               desc = "Toggle outline" },
      { "<leader>ca", ":Lspsaga code_action<CR>",           desc = "Code action" },
      { "<leader>do", ":Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics" },
      { "<leader>dd", ":Lspsaga show_buf_diagnostics<CR>",  desc = "Show diagnostics" },
      { "<leader>gr", ":Lspsaga rename<CR>",                desc = "Rename" }
    },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<CR>",      desc = "toggle terminal" },
      { "<C-t>", "<Esc><cmd>ToggleTerm<CR>", mode = "t",              desc = "toggle terminal" }
    }
  },

  -- buffer
  {
    "akinsho/bufferline.nvim",
    config = function()
      require('bufferline').setup {
        options = {
          always_show_bufferline = true,
          show_close_icon = false,
          show_buffer_close_icons = false,
          hover = { enabled = true, reveal = { 'close' } },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          numbers = "ordinal",
          offsets = { {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            padding = 1,
            text_align = "left"
          } }
        },
      }
    end,
    event = 'BufAdd',
    keys = {
      { "<leader>b[", ":bprev<CR>",                  desc = "buffer before" },
      { "<leader>b]", ":bnext<CR>",                  desc = "buffer next" },
      { "<leader>bd", ":bd<CR>",                     desc = "buffer close" },
      { "<leader>b1", ":BufferLineGoToBuffer 1<CR>", desc = "buffer 1" },
      { "<leader>b2", ":BufferLineGoToBuffer 2<CR>", desc = "buffer 2" },
      { "<leader>b3", ":BufferLineGoToBuffer 3<CR>", desc = "buffer 3" },
      { "<leader>b4", ":BufferLineGoToBuffer 4<CR>", desc = "buffer 4" },
      { "<leader>b5", ":BufferLineGoToBuffer 5<CR>", desc = "buffer 5" },
      { "<leader>b6", ":BufferLineGoToBuffer 6<CR>", desc = "buffer 6" },
      { "<leader>b7", ":BufferLineGoToBuffer 7<CR>", desc = "buffer 7" },
    }
  },

  -- CSS colorize
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = "BufAdd",
    config = function()
      require('colorizer').setup()
    end,
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

  -- jump to any words
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require('hop').setup()
    end,
    keys = {
      { "s", "<cmd>HopWordCurrentLine<CR>", desc = "show jump words in current line" },
      { "S", "<cmd>HopWord<CR>",            desc = "show jump words in current buffer" },
    }
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require('notify').setup({
        background_colour = '#FAFAFA'
      })
      vim.notify = require("notify")
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
      require('telescope').load_extension('projects')
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "list all projects" },
    }
  },

  -- a smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup()
    end
  },

  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },

  {
    "VonHeikemen/fine-cmdline.nvim",
    keys = {
      { ":", '<cmd>FineCmdline<CR>', desc = "show cmdline" }
    }
  },

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/workspace" },
      }
    end
  }
})

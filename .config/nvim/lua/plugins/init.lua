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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                      desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                         desc = "find and switch buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                       desc = "find and grep files" },
      { "<leader>fp", "<cmd>Telescope projects<CR>",                        desc = "find and projects" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG<CR>", desc = "find and grep files" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🔍 ",
        dynamic_preview_title = true,
        file_ignore_patterns = {
          ".idea/",
          ".git/",
          "kitex_gen/",
          "node_modules/",
          "vendor/",
          "target/",
          "build/",
          "output/",
          ".gradle/",
          "dist",
          -- specific file
          "%.class",
          "%.jar",
          "%.so",
          "%.a",
          "%.o",
          "%.out",
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        }
      },
    },
  },

  -- display indents
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#56B6C2 gui=nocombine]]

      require("indent_blankline").setup({
        filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "terminal",
          "text",
          "markdown",
          "git"
        },
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        use_treesitter = true,
        show_first_indent_level = true,
      })
    end,
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
        close_if_last_window = false,
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
    keys = { { '<leader>n', '<cmd>Dashboard<CR>', desc = 'Open dashboard-nvim' } },
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        shortcut_type = 'number',
        config = {
          week_header = {
            enable = true,
          },
          center = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              key = 'f',
              action = 'Telescope find_files',
            },
            {
              icon = ' ',
              desc = 'Apps',
              group = 'DiagnosticHint',
              key = 'a',
              action = 'Telescope projects',
            },
            {
              icon = ' ',
              desc = 'Dotfiles',
              key = 'd',
              action = ':cd ~/.config/nvim | e ~/.config/nvim/init.lua',
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Quit Neovim',
              desc_hl = 'String',
              key = 'q',
              key_hl = 'Number',
              action = ':qa',
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
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
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
        indent = { enable = true },
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
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      })
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

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "Toggle LazyGit" },
    }
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },

  -- markdown preview need to build first
  {
    "iamcco/markdown-preview.nvim",
    build = 'cd app && yarn install',
    ft = "markdown",
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

  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      close_on_exit = true,
      shade_terminals = false,
      highlights = {
        Normal = {
          guibg = '#1e293b'
        }
      }
    },
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<CR>",      desc = "toggle terminal" },
      { "<C-t>", "<Esc><cmd>ToggleTerm<CR>", mode = "t",              desc = "toggle terminal" }
    }
  },

  -- buffer
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      options = {
        always_show_bufferline = true,
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = "thick", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        numbers = "ordinal",
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
            separator = true, -- set to `true` if clear background of neo-tree
          },
          {
            filetype = "NvimTree",
            text = "EXPLORER",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
    keys = {
      { "<leader>b[", ":bprev<CR>",                  desc = "buffer before" },
      { "<leader>b]", ":bnext<CR>",                  desc = "buffer next" },
      { "<leader>bd", ":bdelete<CR>",                desc = "buffer delete" },
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

  -- notify
  {
    "rcarriga/nvim-notify",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        fps = 30,
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade",
        timeout = 5000,
        top_down = true
      })
      vim.notify = notify
    end,
  },

  -- a smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = true
  },

  -- nice cmdline
  {
    "VonHeikemen/fine-cmdline.nvim",
    keys = {
      { ":", '<cmd>FineCmdline<CR>', desc = "show cmdline" }
    }
  },

  -- autosave session
  {
    'rmagatti/auto-session',
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/workspace", "~/Workspace" },
    }
  },

  {
    "olimorris/persisted.nvim",
    config = true
  },

  -- vscode like breadcrum
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },

  -- smart column
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "help", "text", "markdown",
        "NvimTree", "lazy", "mason", "help",
        "neo-tree",
        "dashboard"
      }
    }
  },

  -- increase / decrease
  {
    "RutaTang/compter.nvim",
    config = true,
    opts = {
      templates = {
        -- for number
        {
          pattern = [[-\?\d\+]],
          priority = 0,
          increase = function(content)
            content = tonumber(content)
            return content + 1, true
          end,
          decrease = function(content)
            content = tonumber(content)
            return content - 1, true
          end,
        },
        -- for boolean
        {
          pattern = [[\<\(true\|false\|TRUE\|FALSE\|True\|False\)\>]],
          priority = 100,
          increase = function(content)
            local switch = {
              ["true"] = "false",
              ["false"] = "true",
              ["True"] = "False",
              ["False"] = "True",
              ["TRUE"] = "FALSE",
              ["FALSE"] = "TRUE",
            }
            return switch[content], true
          end,
          decrease = function(content)
            local switch = {
              ["true"] = "false",
              ["false"] = "true",
              ["True"] = "False",
              ["False"] = "True",
              ["TRUE"] = "FALSE",
              ["FALSE"] = "TRUE",
            }
            return switch[content], true
          end,
        }
      }
    }
  },

  -- comment
  {
    "danymat/neogen",
    config = true,
  },

  -- transparent
  {
    "xiyaowong/transparent.nvim",
    opts = {
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {},   -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    }
  },

  -- jump
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
          })
        end,
        desc = "Flash",
      },
    },
  },

  -- scrollbar
  {
    'petertriho/nvim-scrollbar',
    config = true,
    opts = {
      excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        'dashboard',
        'neo-tree'
      },
    }
  },

  -- project manager
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require('project_nvim').setup {
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
      }
      require('telescope').load_extension('projects')
    end,
    event = "VimEnter",
    cmd = "Telescope projects",
  },

})

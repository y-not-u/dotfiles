return {
  -- transparent
  {
    "xiyaowong/transparent.nvim",
    enabled = false,
    config = function()
      require('transparent').clear_prefix('BufferLine')
    end,
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
        'neo-tree',
      },
    }
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

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    keys = {
      { "<leader>un", "<cmd>Noice dismiss<CR>", desc = "Dismiss notifications" },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local notify = require("notify")
      notify.setup({
        fps = 30,
        level = 2,
        minimum_width = 40,
        max_width = 50,
        stages = "fade_in_slide_out",
        render = "wrapped-compact",
        timeout = 3000,
        top_down = true
      })
      vim.notify = notify
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      extensions = { 'neo-tree', 'toggleterm', 'lazy', 'trouble' },
      sections = {
        lualine_a = {
          {
            'diff',
            colored = true,
            diff_color = {
              added    = 'LuaLineDiffAdd',                            -- Changes the diff's added color
              modified = 'LuaLineDiffChange',                         -- Changes the diff's modified color
              removed  = 'LuaLineDiffDelete',                         -- Changes the diff's removed color you
            },
            symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            source = nil,                                             -- A function that works as a data source for diff.
          }
        }
      }
    },
  },

  -- indent
  {
    "echasnovski/mini.indentscope",
    event = { 'BufEnter' },
    version = '*',
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
  },
}

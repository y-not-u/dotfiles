return {
  -- transparent
  {
    "xiyaowong/transparent.nvim",
    config = function()
      -- require('transparent').clear_prefix('lualine')
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
        'neo-tree'
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

  -- nice cmdline
  {
    "VonHeikemen/fine-cmdline.nvim",
    keys = {
      { ":", '<cmd>FineCmdline<CR>', desc = "show cmdline" }
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

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = 'nord',
      },
    },
  },

  -- display indents
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
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
        show_trailing_blankline_indent = true,
        show_current_context = false,
        show_current_context_start = true,
        show_first_indent_level = true,
      })
    end,
  },

  {
    "echasnovski/mini.indentscope",
    event = { 'BufEnter' },
    version = '*',
    config = true,
  },
}

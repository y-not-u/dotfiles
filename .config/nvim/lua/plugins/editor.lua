return {
  -- scrollbar
  {
    'petertriho/nvim-scrollbar',
    config = true,
    enabled = false,
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


  -- automatic highlighting of word under cursor
  {
    'echasnovski/mini.cursorword',
    version = false,
    config = true
  },


  {
    'echasnovski/mini.map',
    version = false,
    event = { 'BufEnter' },
    config = function()
      local map = require('mini.map')
      map.setup {
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
        symbols = {
          encode = map.gen_encode_symbols.block('2x1'),
          scroll_line = '▶',
          scroll_view = '┋',
        },
        window = {
          winblend = 25,
          zindex = 1
        }
      }
      map.open()
    end,
    keys = {
      { "<leader>mt", "<cmd>lua MiniMap.toggle()<CR>", 'toggle mini map' },
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
      { "<leader>N",  "<cmd>Notifications<CR>", desc = "Show notifications" },
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


  -- indent
  {
    "echasnovski/mini.indentscope",
    event = { 'BufEnter' },
    version = false,
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
      symbol = "│",
      options = { try_as_border = true },
    },
  },
}

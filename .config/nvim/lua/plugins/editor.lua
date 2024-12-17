return {
  -- comment
  {
    'echasnovski/mini.comment',
    version = false,
    config = true,
    keys = { 'gc', 'gcc' },
  },

  -- surround actions
  {
    'echasnovski/mini.surround',
    version = false,
    event = "InsertEnter",
    config = true
  },

  -- automatic highlighting of word under cursor
  {
    'echasnovski/mini.cursorword',
    version = false,
    config = true
  },

  -- vscode like breadcrum
  {
    "utilyre/barbecue.nvim",
    event = { "BufRead" },
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local notify = require("notify")
      notify.setup {
        fps = 30,
        level = 2,
        minimum_width = 40,
        max_width = 50,
        stages = "fade_in_slide_out",
        render = "wrapped-compact",
        timeout = 3000,
        top_down = true
      }
      vim.notify = notify
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { 'BufReadPost', 'BufNewFile' },
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

  -- todo
  {
    "folke/todo-comments.nvim",
    event = { 'BufRead', 'BufNewFile' },
    config = true
  },

  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      exclude = {
        "help", "text", "markdown", "man",
        "NvimTree", "lazy", "mason", "neo-tree",
        "dashboard",
        "command-line",
        "checkhealth",
        "lspinfo",
        "Trounble",
        "noice"
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
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        refresh_delay = 75,
        alpha = 0.75,
        blend_color = "#000000",
        hide = {
          underline = true,
          virtual_text = true,
          signs = true,
        },
        regex = {
          "[uU]nused",
          "[nN]ever [rR]ead",
          "[nN]ot [rR]ead",
        },
        priority = 128,
        disable = {},
      })
    end
  }
}

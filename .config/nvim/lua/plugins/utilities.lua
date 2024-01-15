return {
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
      vim.o.timeoutlen = 500
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },

  -- smart column
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "help", "text", "markdown",
        "NvimTree", "lazy", "mason", "help",
        "neo-tree",
        "dashboard",
        "command-line"
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

  -- jump
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   keys = {
  --     {
  --       "s",
  --       mode = { "n", "x", "o" },
  --       function()
  --         require("flash").jump({
  --           search = {
  --             mode = function(str)
  --               return "\\<" .. str
  --             end,
  --           },
  --         })
  --       end,
  --       desc = "Flash",
  --     },
  --   },
  -- },

  -- gcc comment
  {
    "numToStr/Comment.nvim",
    config = true,
    lazy = true,
    event = "BufRead",
  },

  -- todo
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = true
  },

  -- project
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/Workspace/Startup/Reader/*",
        "~/Workspace/Blog",
        "~/Workspace/dotfiles"
      },
    },
    keys = {
      { "<leader>fp", "<cmd>Telescope neovim-project discover<CR>", desc = "find projects" },
    },
    dependencies = { "nvim-telescope/telescope.nvim", "Shatur/neovim-session-manager" },
    priority = 100,
  },
  -- improve yank
  {
    "gbprod/yanky.nvim",
    config = true,
    opts = {},
    keys = {
      { "<leader>p", "<cmd>YankyRingHistory<CR>", desc = "show yank history" },
    }
  }
}

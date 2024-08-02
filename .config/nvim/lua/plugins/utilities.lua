return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>b"] = { group = "buffer" },
        ["<leader>c"] = { group = "code" },
        ["<leader>f"] = { group = "file/find" },
        ["<leader>g"] = { group = "git" },
        ["<leader>h"] = { group = "harpoon" },
        ["<leader>q"] = { group = "Quit" },
        ["<leader>s"] = { group = "search" },
        ["<leader>u"] = { group = "ui" },
        ["<leader>w"] = { group = "Save" },
        ["<leader>x"] = { group = "diagnostics/quickfix" },
        f = {
          name = "file",
        }
      },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
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

  -- jump
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
    },
  },

  -- auto save
  {
    "okuuva/auto-save.nvim",
    -- cmd = "ASToggle",                         -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      execution_message = {
        enabled = false
      },
      debounce_delay = 5000,
    },
  },

  -- url open
  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
    -- keys = {
    --   { "<leader>a", "<cmd>lua require('harpoon'):list():add()<CR>",                                    desc = "Mark file with harpoon" },
    --   { "<C-e>",     "<cmd>lua require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list())<CR>", desc = "Show harpoon marks" },
    -- }
  },

  -- vim-sleuth
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- clipboard history
  {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
    }
  },

  -- better escape for jk
  {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    config = function()
      require("better_escape").setup({
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              k = "<Esc>",
              j = "<Esc>",
            },
          },
        },
      })
    end,
  },
  {
    "nathom/filetype.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            h = "cpp",
          },
        }
      })
    end
  }
}

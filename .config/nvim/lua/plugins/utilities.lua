return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    enabled = true,
    opts = {
      quickfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "projects", padding = 1 },
          { section = "keys",     padding = 1 },
          { section = "startup" },
        },
      },
      input = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      { "<leader>gb", function() Snacks.git.blame_line() end,        desc = "Git blame Line" },
      { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
      { "<leader>z",  function() Snacks.zen() end,                   desc = "Toggle Zen Mode" },
      { "<leader>.",  function() Snacks.scratch() end,               desc = "Toggle Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    }
  },
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
    -- event = "VeryLazy",
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

  {
    "brianhuster/autosave.nvim",
    event = "InsertEnter",
    config = true,
  },

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
      -- vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end,                                    desc = "Mark file with harpoon" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Show harpoon marks" },
      -- { "<C-e>",      "<cmd>lua require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list())<CR>", desc = "Show harpoon marks" },
    }
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
  },
  {
    "NStefan002/screenkey.nvim",
    version = "*",
    cmd = "Screenkey",
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      }
    },
    -- live preivew
    {
      'brianhuster/live-preview.nvim',
      config = true,
      cmd = { "LivePreview", "StopPreview" },
    }
  },
}

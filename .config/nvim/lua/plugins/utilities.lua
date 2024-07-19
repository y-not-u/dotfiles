return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = false,
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
    cmd = "ASToggle",                         -- optional for lazy loading on command
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

  -- wakatime
  { "wakatime/vim-wakatime" },

  -- vim-sleuth
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- big file not loading plugins
  {
    'LunarVim/bigfile.nvim',
    event = { "FileReadPre", "BufReadPre", "User FileOpened" },
    opts = {
      filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern or function see
      features = {       -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    },
  },

  -- clipboard history
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        "<leader>p",
        "<cmd>:Telescope neoclip<CR>",
        desc = "Flash Jump",
      },
    },
    config = function()
      require('neoclip').setup()
    end,
  }
}

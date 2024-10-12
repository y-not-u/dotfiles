local window = require "utils.window"

return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
        },
      })
    end,
  },
  {
    "yetone/avante.nvim",
    -- event = "VeryLazy",
    version = false,
    keys = {
      { "<leader>aa", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
    },
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://burn.hair/v1",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      windows = {
        width = window.side_width,
        sidebar_header = {
          align = "right", -- left, center, right for title
          rounded = false,
        },
      }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  }
}

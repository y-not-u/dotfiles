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
    event = "VeryLazy",
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://burn.hair/v1",
        model = "gpt-4o-mini",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  }
}

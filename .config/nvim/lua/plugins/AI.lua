return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    enabled = false,
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
    "github/copilot.vim",
    config = true,
  }
}

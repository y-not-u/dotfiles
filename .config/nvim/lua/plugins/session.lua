return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/Workspace', '~/Projects' },
      })
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope session-lens<CR>", desc = "List sessions" }
    }
  },
}

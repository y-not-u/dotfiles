return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/', '/' },
        auto_session_allowed_dirs = { '~/Workspace/*', '~/Projects/*' },
        auto_session_enable_last_session = true,
      })
    end,
  },
}

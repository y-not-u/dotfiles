return {
  -- dashboard
  {
    'glepnir/dashboard-nvim', -- start dashboard
    event = 'VimEnter',
    enabled = true,
    keys = { { '<leader>n', '<cmd>Dashboard<CR>', desc = 'Open dashboard-nvim' } },
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        shortcut_type = 'number',
        config = {
          week_header = {
            enable = true,
          },
          center = {
            {
              icon = ' ',
              desc = 'New File',
              group = 'Label',
              action = 'ene | startinsert',
              key = 'n'
            },
            { icon = ' ', desc = 'Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              desc = 'Find files',
              group = 'Label',
              key = 'f',
              action = 'Telescope find_files',
            },
            {
              icon = ' ',
              desc = 'Projects',
              key = 'p',
              action = 'Telescope session-lens',
            },
            {
              icon = ' ',
              desc = 'Dotfiles',
              key = 'd',
              action = ':cd ~/.config/nvim | e ~/.config/nvim/init.lua',
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Quit Neovim',
              key = 'q',
              action = ':qa',
            },
          },
        },
      }
    end
  },
}

return {
  -- dashboard
  {
    'glepnir/dashboard-nvim', -- start dashboard
    event = 'VimEnter',
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
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              key = 'f',
              action = 'Telescope find_files',
            },
            {
              icon = ' ',
              desc = 'Apps',
              group = 'DiagnosticHint',
              key = 'a',
              action = 'Telescope projects',
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
              desc_hl = 'String',
              key = 'q',
              key_hl = 'Number',
              action = ':qa',
            },
          },
        },
      }
    end
  },

}

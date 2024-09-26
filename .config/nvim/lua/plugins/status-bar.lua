return {
  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = {
          statusline = {
            "neo-tree", "undutree", "dashboard", "alpha", "starter", "NvimTree",
            "AvanteInput"
          }
        },
        component_separators = '|',
        section_separators = '',
      },
      extensions = { 'neo-tree', 'toggleterm', 'lazy', 'trouble' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'diff',
            colored = true,
            diff_color = {
              added    = 'LuaLineDiffAdd',                            -- Changes the diff's added color
              modified = 'LuaLineDiffChange',                         -- Changes the diff's modified color
              removed  = 'LuaLineDiffDelete',                         -- Changes the diff's removed color you
            },
            symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            source = nil,                                             -- A function that works as a data source for diff.
          },
          'filename',
          'lsp_progress',
        },
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            -- color = { fg = "#a89984" },
          },
          require('pomodoro').statusline,
          'encoding',
          'fileformat',
          'filetype',
        },
      }
    },
  },
}

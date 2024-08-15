-- terminal
return {
  {
    'nyngwang/NeoTerm.lua',
    config = function()
      require('neo-term').setup {
        exclude_filetypes = { 'oil' },
        -- exclude_buftypes = {}, -- 'terminal' will always be added by NeoTerm.lua
        -- enabled by default!
        -- presets = {
        --   'vim-test',
        -- }
      }
    end,
    keys = {
      { "<C-t>", '<cmd>NeoTermToggle<CR>',      mode = 'n', desc = "toggle terminal" },
      { "<ESC>", "<cmd>NeoTermEnterNormal<CR>", mode = "t", desc = "toggle terminal" },
    }
  }
}

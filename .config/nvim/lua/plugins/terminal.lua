return {
  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      close_on_exit = true,
      shade_terminals = false,
      highlights = {
        Normal = {
          guibg = '#191927'
        }
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    },
    keys = {
      { "<C-\\>", '<cmd>exe v:count1 . "ToggleTerm"<CR>',      desc = "toggle terminal" },
      { "<C-\\>", "<Esc><cmd>ToggleTerm<CR>", mode = "t",              desc = "toggle terminal" }
    }
  },
}

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
    },
    keys = {
      { "<C-\\>", '<cmd>exe v:count1 . "ToggleTerm"<CR>',      desc = "toggle terminal" },
      { "<C-\\>", '<Esc><cmd>exe v:count1 . "ToggleTerm"<CR>', mode = "i",              desc = "toggle terminal" },
      { "<C-\\>", "<Esc><cmd>ToggleTerm<CR>",                  mode = "t",              desc = "toggle terminal", buffer = 0 },
      -- { "<Esc>",  [[<C-\><C-n>]],                              mode = "t",              desc = "Esc in terminal", buffer = 0 },
      { "<S-h>",  "<Cmd>wincmd h<CR>",                         mode = "t",              desc = "Left",            buffer = 0 },
      { "<S-j>",  "<Cmd>wincmd j<CR>",                         mode = "t",              desc = "Down",            buffer = 0 },
      { "<S-k>",  "<Cmd>wincmd k<CR>",                         mode = "t",              desc = "Up",              buffer = 0 },
      { "<S-l>",  "<Cmd>wincmd l<CR>",                         mode = "t",              desc = "Right",           buffer = 0 },
    }
  },
}

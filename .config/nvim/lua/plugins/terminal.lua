return {
  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      close_on_exit = true,
      shade_terminals = false,
      direction = "float",
      highlights = {
        Normal = {
          guibg = '#1e293b'
        }
      }
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>",      desc = "toggle terminal" },
      { "<C-\\>", "<Esc><cmd>ToggleTerm<CR>", mode = "t",              desc = "toggle terminal" }
    }
  },
}

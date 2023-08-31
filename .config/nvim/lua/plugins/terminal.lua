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
          guibg = '#1e293b'
        }
      }
    },
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<CR>",      desc = "toggle terminal" },
      { "<C-t>", "<Esc><cmd>ToggleTerm<CR>", mode = "t",              desc = "toggle terminal" }
    }
  },
}

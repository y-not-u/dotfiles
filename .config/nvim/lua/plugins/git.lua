return {
  -- git status
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufEnter" },
    opts = {
      current_line_blame = true
    }
  },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "Toggle LazyGit" },
    }
  },
}

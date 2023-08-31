return {
  -- git status
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end
  },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "Toggle LazyGit" },
    }
  },
}

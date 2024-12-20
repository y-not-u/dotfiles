return {
  -- git status
  {
    "lewis6991/gitsigns.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true
    }
  },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Toggle LazyGit" },
    }
  },

  -- git diff view
  {
    "sindrets/diffview.nvim",
    config = true,
    cmd = {
      "Diffviewopen"
    }
  }
}

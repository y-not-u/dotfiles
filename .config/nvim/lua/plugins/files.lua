return {
  -- search files
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                      desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                         desc = "find and switch buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                       desc = "find and grep files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                        desc = "find recent files" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG<CR>", desc = "find and grep files" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🔍 ",
        dynamic_preview_title = true,
        file_ignore_patterns = {
          ".idea/",
          ".git/",
          "kitex_gen/",
          "node_modules/",
          "vendor/",
          "target/",
          "build/",
          "output/",
          ".gradle/",
          "dist",
          -- specific file
          "%.class",
          "%.jar",
          "%.so",
          "%.a",
          "%.o",
          "%.out",
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        }
      },
    },
  },
}

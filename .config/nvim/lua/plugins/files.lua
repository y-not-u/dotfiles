return {
  -- search files
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                      desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                         desc = "find and switch buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                       desc = "find and grep files" },
      { "<leader>?",  "<cmd>Telescope oldfiles<CR>",                        desc = "find recent files" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG<CR>", desc = "find and grep todo things" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",                       desc = "show help tags" },
      { "<leader>fs", "<cmd>Telescope git_status<CR>",                      desc = "show git status" },
    },
    opts = {
      defaults = {
        prompt_prefix = "🔍 ",
        path_display = { "smart" },
        dynamic_preview_title = true,
        file_ignore_patterns = {
          ".idea/",
          ".git/",
          "coverage/",
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
          find_command = {
            "rg", "--files", "--hidden", "-u",
            "-g", "!.git/",
            "-g", "!node_modules/",
            "-g", "!dist/",
            "-g", "!coverage/",
            "-g", "!build/",
            "-g", "!vendor/",
            "-g", "!target/",
            "-g", "!.idea/",
            "-g", "!.vscode/",
          },
        }
      },
    },
  },
}

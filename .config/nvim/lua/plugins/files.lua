return {
  -- search files
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                      desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                         desc = "find and switch buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                       desc = "find and grep files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                        desc = "find recent files" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG<CR>", desc = "find and grep todo things" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",                       desc = "show help tags" },
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

  -- bookmarks
  {
    'crusj/bookmarks.nvim',
    keys = {
      { "<tab><tab>", mode = { "n" } },
    },
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end
  },

  -- project
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/Workspace/*",
        "~/Workspace/Startup/Reader/*",
      },
      last_session_on_startup = false,
    },
    keys = {
      { "<leader>fp", "<cmd>Telescope neovim-project discover<CR>", desc = "find projects" },
    },
    dependencies = { "nvim-telescope/telescope.nvim", "Shatur/neovim-session-manager" },
    lazy = false,
    priority = 100,
  },
}

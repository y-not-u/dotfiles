require('base')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "folke/which-key.nvim", lazy = true },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    cmd = "Telescope",
    keys = {
      { "<leader>p", ":Telescope find_files<CR>", desc = "find files" }
    },
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { 
    "numToStr/Comment.nvim",
    -- lazy = true,
    config = function()
      require("Comment").setup()
    end
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  { 
    "preservim/nerdtree",
    lazy = true,
    cmd = "NERDTree",
    keys = {
      { "<leader>e", ":NERDTreeToggle<CR>", desc = "show nerdtree" }
    }
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
           enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end
  },
  { 
    "junegunn/fzf.vim",
    lazy = true,
    cmd = 'Rg',
    keys = {
      { "<leader>f", ":Rg<CR>", desc = "search contents" }
    },
    dependencies = { "junegunn/fzf" }
  },
})

return {
  -- color scheme
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme catppuccin]])
  --   end
  -- }
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = true

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        }
      })

      vim.cmd([[colorscheme tokyonight-moon]])
      vim.cmd([[highlight Visual guibg=#A855F7 guifg=#ffffff gui=none]])
    end
  }
}

return {
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false, -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  }
}

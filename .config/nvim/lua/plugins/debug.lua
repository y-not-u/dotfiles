return {
  -- run jest
  {
    "mattkubej/jest.nvim",
    lazy = true,
    enabled = false,
    cmd = {
      "Jest",
      "JestFile",
      "JestSingle"
    }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
    },
    cmd = { "Neotest "},
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
    }
  }
}

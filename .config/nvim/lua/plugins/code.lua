return {

  -- comment
  {
    "danymat/neogen",
    config = true,
  },

  -- CSS colorize
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = "BufAdd",
    config = true
  },

  -- run jest
  {
    "mattkubej/jest.nvim",
    lazy = true,
    cmd = {
      "Jest",
      "JestFile",
      "JestSingle"
    }
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },
  -- auto tag
  {
    "windwp/nvim-ts-autotag",
    config = true,
    lazy = true,
    event = "BufAdd",
  },
}

return {
  {
    "Exafunction/codeium.nvim",
    event = { "InsertEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
  {
    "Aaronik/GPTModels.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim"
    },
    keys = {
      { "<leader>a", ":GPTModelsCode<CR>", mode = "v" },
      { "<leader>a", ":GPTModelsCode<CR>", mode = "v" }
    },
  },
}

return {
  {
    "akinsho/bufferline.nvim",
    event = { "VeryLazy" },
    opts = {
      options = {
        always_show_bufferline = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = "thick", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        numbers = "ordinal",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            highlight = "Directory",
            -- separator = true, -- set to `true` if clear background of neo-tree
          },
        },
      },
      highlights = {
        buffer_selected = {
          italic = false
        },
        indicator_selected = {
          fg = { attribute = 'fg', highlight = 'Function' },
          italic = false
        }
      }
    },
    keys = {
      { "<leader>b[", ":bprev<CR>",                      desc = "buffer before" },
      { "<leader>b]", ":bnext<CR>",                      desc = "buffer next" },
      { "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "buffer 1" },
      { "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "buffer 2" },
      { "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "buffer 3" },
      { "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "buffer 4" },
      { "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "buffer 5" },
      { "<leader>b6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "buffer 6" },
      { "<leader>b7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "buffer 7" },
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev" },
    }
  },
  -- buffer delete
  {
    'famiu/bufdelete.nvim',
    keys = {
      { "<leader>bd", "<Cmd>Bdelete<CR>",   desc = "buffer delete" },
      { "<leader>ba", "<Cmd>bufdo bd!<CR>", desc = "buffer all delete" },
    }
  },
}

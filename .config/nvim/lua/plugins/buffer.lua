return {
  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    opts = {
      options = {
        always_show_bufferline = true,
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
            text = "EXPLORER",
            text_align = "center",
            separator = true, -- set to `true` if clear background of neo-tree
          },
          {
            filetype = "NvimTree",
            text = "EXPLORER",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
    keys = {
      { "<leader>b[", ":bprev<CR>",                  desc = "buffer before" },
      { "<leader>b]", ":bnext<CR>",                  desc = "buffer next" },
      { "<leader>bd", ":bdelete!<CR>",               desc = "buffer delete" },
      { "<leader>x",  ":bdelete!<CR>",               desc = "buffer delete" },
      { "<leader>b1", ":BufferLineGoToBuffer 1<CR>", desc = "buffer 1" },
      { "<leader>b2", ":BufferLineGoToBuffer 2<CR>", desc = "buffer 2" },
      { "<leader>b3", ":BufferLineGoToBuffer 3<CR>", desc = "buffer 3" },
      { "<leader>b4", ":BufferLineGoToBuffer 4<CR>", desc = "buffer 4" },
      { "<leader>b5", ":BufferLineGoToBuffer 5<CR>", desc = "buffer 5" },
      { "<leader>b6", ":BufferLineGoToBuffer 6<CR>", desc = "buffer 6" },
      { "<leader>b7", ":BufferLineGoToBuffer 7<CR>", desc = "buffer 7" },
    }
  },
}

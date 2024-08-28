return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree action=focus toggle reveal<CR>", desc = "file explor" }
  },
  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      default_component_configs = {
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed  = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
      close_if_last_window = false,
      window = {
        width = 30,
        position = "right",
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            "node_modules"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
          always_show = {
            ".env"
          }
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        }
      },
      -- Add this section only if you've configured source selector.
      source_selector = {
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
    })
  end,
}

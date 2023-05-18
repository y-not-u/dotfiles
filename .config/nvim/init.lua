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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "folke/which-key.nvim", lazy = true }, -- show shortcuts
  { "folke/neoconf.nvim", cmd = "Neoconf" }, -- unknown
  {
    cmd = "Telescope", -- find files
    keys = {
      { "<leader>p", ":Telescope find_files<CR>", desc = "find files" }
    },
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "lukas-reineke/indent-blankline.nvim" }, -- show indent
  { 
    "numToStr/Comment.nvim", -- gcc comment
    -- lazy = true,
    config = function()
      require("Comment").setup()
    end
  },
  { "nvim-tree/nvim-web-devicons", lazy = true }, -- icons
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
    "preservim/nerdtree", -- file tree
    lazy = true,
    cmd = "NERDTree",
    keys = {
      { "<leader>e", ":NERDTreeToggle<CR>", desc = "show nerdtree" }
    }
  },
  {
    'glepnir/dashboard-nvim', -- start dashboard
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
    "junegunn/fzf.vim", -- fzf fuzzy find files and contents
    lazy = true,
    cmd = 'Rg',
    keys = {
      { "<leader>f", ":Rg<CR>", desc = "search contents" }
    },
    dependencies = { "junegunn/fzf" }
  },
  {
    "vim-airline/vim-airline", -- status bar
  },
  { 'rose-pine/neovim', name = 'rose-pine' }, -- color scheme
  { 
    "TimUntersberger/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>g", ":Neogit<CR>", desc = "Neogit" }
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "python", "tsx", "css", "scss", "json", "lua", "html" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "c", "rust" },
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    config = function() 
      local lsp = require("lsp-zero").preset("recommended")
      lsp.ensure_installed({
        'tsserver', -- js / ts
        'eslint',
        'html',
        'tailwindcss',
        'volar', -- vue
        'pyright', -- python
        'lua_ls', -- lua
      })
      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })
      
      lsp.setup()

      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({select = true}),
        }
      })
    end,
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },
  {
    "airblade/vim-gitgutter",
  }
})

vim.cmd('colorscheme rose-pine')

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

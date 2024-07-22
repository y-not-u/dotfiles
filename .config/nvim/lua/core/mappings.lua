local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Lazy
map('n', '<leader>l', '<cmd>Lazy<CR>', opts)

-- Quit
map('n', '<leader>q', '<cmd>q<CR>', opts)

-- Quit All
map('n', '<leader>Q', '<cmd>qa!<CR>', opts)

-- Fast saving
map('n', '<leader>w', '<cmd>w!<CR>', opts)

-- Reaload Configuration without restart nvim
map('n', '<leader>r', '<cmd>so %<CR>', opts)

-- buffer
map('n', '[b', '<cmd>bp<CR>', term_opts)
map('n', ']b', '<cmd>bn<CR>', term_opts)
map('n', '<S-h>', '<cmd>bp<CR>', term_opts)
map('n', '<S-l>', '<cmd>bn<CR>', term_opts)
map('n', '[[', '<cmd>bp<CR>', term_opts)
map('n', ']]', '<cmd>bn<CR>', term_opts)
map("n", "<leader>bb", "<cmd>e #<cr>", term_opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", opts)

-- jk to esc
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- Clear search with <esc>
map("n", "<esc>", "<cmd>noh<cr><esc>", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

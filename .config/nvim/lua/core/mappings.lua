local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Lazy
map('n', '<leader>l', '<cmd>Lazy<CR>', opts)

-- Quit
map('n', '<leader>q', '<cmd>q<CR>', opts)

-- Quit All
map('n', '<leader>Q', '<cmd>qa!<CR>', opts)

-- Fast saving
map('n', '<leader>w', '<cmd>write<CR>', opts)

-- Reaload Configuration without restart nvim
map('n', '<leader>r', '<cmd>so %<CR>', opts)

-- buffer
map('n', '[b', '<cmd>bp<CR>', term_opts)
map('n', ']b', '<cmd>bn<CR>', term_opts)
map('n', '[[', '<cmd>bp<CR>', term_opts)
map('n', ']]', '<cmd>bn<CR>', term_opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", opts)

-- jk to esc
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

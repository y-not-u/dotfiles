local map = vim.api.nvim_set_keymap

map('n', '<leader>qq', '<cmd>q<CR>', { noremap = true, silent = true })
map('n', '<leader>qa', '<cmd>qa!<CR>', { noremap = true, silent = true })
map('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>so %<CR>', { noremap = true })

-- buffer
map('n', '[b', '<cmd>bp<CR>', { noremap = true })
map('n', ']b', '<cmd>bn<CR>', { noremap = true })
map('n', '[[', '<cmd>bp<CR>', { noremap = true })
map('n', ']]', '<cmd>bn<CR>', { noremap = true })


-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", { noremap = true, silent = true })

-- open vim config
map("n", "<Leader>rc", ":e $MYVIMRC<CR>", { noremap = true })

-- jk to esc
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

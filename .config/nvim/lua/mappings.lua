local map = vim.api.nvim_set_keymap

map('n', '<leader>qq', '<cmd>q<CR>', { noremap = true, silent = true })
map('n', '<leader>qa', '<cmd>qa!<CR>', { noremap = true, silent = true })
map('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>so %<CR>', { noremap = true })

map('n', '<C-t>', ':Term<CR>', { noremap = true })
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", { noremap = true, silent = true })

-- open vim config
map("n", "<Leader>rc", ":e $MYVIMRC<CR>", { noremap = true })

-- jk to esc
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

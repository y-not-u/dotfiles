local map = vim.api.nvim_set_keymap

map('n', '<leader>q', '<cmd>qa!<CR>', { noremap = true, silent = true })
map('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true })

-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", { noremap = true, silent = true })

-- open vim config
map("n", "<Leader>rc", ":e $MYVIMRC<CR>", { noremap = true })

-- jk to esc
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

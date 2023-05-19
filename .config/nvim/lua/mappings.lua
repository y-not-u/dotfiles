local map = vim.api.nvim_set_keymap

map('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
map('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
map('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

-- save as root
map("c", "w!!", "w !sudo tee % >/dev/null<CR>:e!<CR><CR>", { noremap = true })

-- open vim config
map("n", "<Leader>rc", ":e $MYVIMRC<CR>", { noremap = true })

-- buffer navigation
map("n", "<Leader>ls", ":buffers<CR>", { noremap = true })

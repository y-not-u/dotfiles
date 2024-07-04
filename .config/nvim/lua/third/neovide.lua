local opts = {
  silent = true,
  noremap = true
}
local map = vim.api.nvim_set_keymap

vim.opt.guifont = "Hack Nerd Font:h16"
-- vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_input_use_logo = 1
map("", "<D-v>", "\"+p<CR>", opts)
map("!", "<D-v>", "<C-R>+", opts)
map("t", "<D-v>", "<C-R>+", opts)
map("v", "<D-c>", "\"+y<CR>", opts)

-- scale font size at runtime
vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
  { silent = true })
vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
  { silent = true })
vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })

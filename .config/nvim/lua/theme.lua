vim.opt.termguicolors = true
vim.opt.guifont = "Hack Nerd Font"
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")

-- highlight the line on yank
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })'

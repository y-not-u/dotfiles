local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

opt.mouse = 'a'
opt.encoding = 'utf-8'
opt.hidden = true
opt.swapfile = false
opt.title = true
-- opt.cmdheight=0
opt.signcolumn = "yes"
opt.ignorecase = true -- case insensitive
opt.smartindent = true
opt.relativenumber = true
opt.number = true
opt.hlsearch = true
opt.cursorline = true -- highlight current cursorline
opt.incsearch = true  -- incremental search
opt.softtabstop = 2   -- see multiple spaces as tabstops so <BS> does the right thing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true  -- converts tabs to white space
opt.autoindent = true -- indent a new line the same amount as the line just typed
opt.autochdir = false
opt.autowrite = true
opt.backup = false
opt.writebackup = false
opt.colorcolumn = "80"
opt.scrolloff = 999
opt.clipboard = "unnamedplus"


cmd 'au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })'

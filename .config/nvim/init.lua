require('base')
require('mappings')

if vim.fn.exists "g:vscode" ~= 1 then
  require "theme"
  require "plugins"
end

if vim.g.neovide then
  require('neovide')
end

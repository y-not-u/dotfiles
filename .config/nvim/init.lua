require('base')
require('mappings')

if vim.fn.exists "g:vscode" ~= 1 then
  require "plugins"
  require "theme"
end

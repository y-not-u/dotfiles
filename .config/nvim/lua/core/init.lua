require('core.base')
require('core.mappings')

if vim.fn.exists "g:vscode" ~= 1 then
  require "core.theme"
end

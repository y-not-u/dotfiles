require('core.base')
require('core.mappings')
require('core.indent')

if vim.fn.exists "g:vscode" ~= 1 then
  require "core.theme"
end

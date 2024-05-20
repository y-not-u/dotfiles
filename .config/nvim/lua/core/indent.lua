vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "html", "css", "json" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})

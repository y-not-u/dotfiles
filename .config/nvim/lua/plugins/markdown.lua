return {
  -- markdown preview need to build first
  {
    "iamcco/markdown-preview.nvim",
    build = 'cd app && yarn install',
    ft = "markdown",
  },
}

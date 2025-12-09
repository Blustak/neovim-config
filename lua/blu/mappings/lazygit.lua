---@module 'which-key'
local wk = require("which-key")
wk.add({
  mode = { "n" },
  {"<leader>l", group = "LazyGit"},
  {"<leader>lg", "<CMD>LazyGit<CR>", desc = "LazyGit"},
  {"<leader>lf", "<CMD>LazyGitFilter", desc = "LazyGitFilter"},
  {"<leader>lb", "<CMD>LazyGitFilterCurrentFile", desc = "LazyGitFilterCurrentFile"}
})

---@module 'which-key'
local wk = require("which-key")

wk.add( {
  mode = {"n","v"},
  {"<leader>rr", function() vim.lsp.buf.hover() end}
})

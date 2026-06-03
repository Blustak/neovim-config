---@module 'which-key'
local wk = require("which-key")

local cmo = require("blink.cmp")

wk.add( {
  mode = {"n","v"},
  {"<leader>rr", function() vim.lsp.buf.hover() end}
})

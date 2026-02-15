if not package.loaded["trouble"] then return end
 
--- @module "which-key"
local wk = require("which-key")

wk.add({
  mode = { "n" },
  { "<leader>x",  group = "Trouble" },
  { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>",                        desc = "Diagnostics (Trouble)" },
  { "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",           desc = "Buffer diagnostics (Trouble)" },
  { "<leader>cs", "<CMD>Trouble symbols toggle focus=false<CR>",                desc = "Symbols (Trouble)" },
  { "<leader>cl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions / references / ... (Trouble)" },
  { "<leader>xL", "<CMD>Trouble loclist toggle<CR>",                            desc = "Location List (Trouble)" },
  { "<leader>xC", "<CMD>Trouble qflist toggle<CR>",                             desc = "Quickfix list (Trouble)" },
})

---@module 'which-key'
local wk = require("which-key")

wk.add({
  mode = {"n"},
  {"<leader>g", group = "LSP"},
  {"<leader>gg", vim.diagnostic.open_float},
  {"<leader>gf", vim.lsp.buf.format, desc = "LSP format buf"},
  {"<leader>gt", vim.lsp.buf.type_definition, desc = "LSP goto type def"},
  {"<leader>gr", vim.lsp.buf.references, desc = "LSP get refs"},
  {"<leader>gds", vim.lsp.buf.document_symbol, desc = "LSP document symbol"},
  {"<leader>gws", function ()
    vim.lsp.buf.workspace_symbol("")
  end, desc = "get all workspace symbols"},
  {"<leader>gs",vim.lsp.buf.rename, desc = "rename symbol"}
})

wk.add({
  {"<leader>aa","gra",desc = "code action"}
})

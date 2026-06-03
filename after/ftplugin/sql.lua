vim.treesitter.start()
vim.bo.indentexpr = "nvim_treesitter#indent()"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.o.foldlevelstart = 99

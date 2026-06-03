vim.treesitter.start()
vim.opt_local.autoread = true
vim.bo.indentexpr = "nvim_treesitter#indent()"

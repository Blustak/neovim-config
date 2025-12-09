vim.g.mapleader = " "
require('vim._extui').enable({})
require("blu.options")
require("lazy").setup({
	spec = {
		import = "blu.plugins"
	},
	install = {},
	checker = { enabled = true, notify = false },
})
require("blu.plugin_opts")
require("blu.mappings")
require("blu.lsp")
require("blu.dap")
require('blu.autocmd')

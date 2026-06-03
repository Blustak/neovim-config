vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = { '*.tex' },
  callback = function()
    vim.lsp.start {
      name = "texlab",
      cmd = { "texlab" },
      root_dir = vim.fn.getcwd()
    }
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp"},
  callback = function ()
    vim.lsp.start({
      name = "clangd",
      cmd = {"clangd", "--background-index" },
      root_dir = vim.fn.getcwd(),
    })
  end
})

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


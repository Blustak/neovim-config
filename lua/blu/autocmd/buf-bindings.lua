local glow_grp_id = vim.api.nvim_create_augroup("glow-binds", {})
local autofmt_id = vim.api.nvim_create_augroup("AutoFmt", {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = autofmt_id,
  pattern = "*.py",
  desc = "Format with black",
  callback = function()
    vim.cmd([[!black -q <afile>]])
    vim.cmd('edit')
  end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {"*.zig", "*.zon"},
  callback = function (ev)
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = glow_grp_id,
  pattern = "*.md",
  desc = "Markdown file bindings",
  callback = function()
    vim.keymap.set('n', '<leader>gg', '<CMD>Glow<CR>', { buffer = true })
  end
})


vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = "*/.config/zsh/*",
  desc = "Set the buffer type for files in zsh",
  callback = "set filetype=zsh"
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { "*.hl", "hypr*.conf" },
  desc = "Attach hyprls to the buffer.",
  callback = function()
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    }
  end
})


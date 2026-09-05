local vim = vim
local api = vim.api
local augroup_id = api.nvim_create_augroup("c_syntax_hl", {
  clear = true
})

api.nvim_create_autocmd(
  {'BufNewFile', 'BufRead'},
  {
  pattern = {'*.c', '*.h'},
  callback = function(ev)
    vim.bo.filetype = "c"
  end,
  group = augroup_id
  }
)

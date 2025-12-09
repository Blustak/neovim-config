local project_root = "/home/blu/workspace/github/Blus/go-avorion-trader"
local project_pattern = {'$HOME/workspace/github/Blus/go-avorion-trader/*.go'}
local make_cmd = 'make\\ \\-C\\ ' .. project_root .. '\\ {$*}'


local id
local get_id = function ()
    id = vim.api.nvim_create_augroup('blu.project.configs',{clear = true})
    return id
end
vim.api.nvim_create_autocmd({'BufEnter'},{
  group = get_id(),
  pattern = project_pattern,
  callback = function ()
    vim.bo.makeprg = make_cmd
  end
})

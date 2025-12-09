local state = {
  enabled = false
}

local enableCenterCursor = function()
  local groupID = vim.api.nvim_create_augroup("CenterCursor", {
    clear = true,
  })
  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    group = groupID,
    callback = function()
      local pos = vim.fn.getpos(".")
      vim.cmd("normal! zz")
      vim.fn.setpos(".", pos)
      state.enabled = true
    end
  })
end

local disableCenterCursor = function()
  vim.api.nvim_create_augroup("CenterCursor", {
    clear = true
  })
  state.enabled=false
end

vim.api.nvim_create_user_command("EnableCenterCursor", enableCenterCursor, {})

vim.api.nvim_create_user_command("DisableCenterCursor", disableCenterCursor, {})

vim.api.nvim_create_user_command("ToggleCenterCursor", function()
  if state.enabled then
    disableCenterCursor()
  else
    enableCenterCursor()
  end
end, {})

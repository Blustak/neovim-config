local default_v = require('blu.config').codelens.enable_codelens

--
-- vim.api.nvim_create_user_command('EnableCodeLens', function()
--   local codelens_grp = vim.api.nvim_create_augroup("codelens_grp", {clear = false})
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.api.nvim_create_autocmd({
--     'BufEnter',
--     'CursorHold',
--     'InsertLeave',
-- }, {
--     group = codelens_grp,
--     buffer = bufnr,
--     callback = function()
--     end
--   })
-- end, {desc = "Enable Code lens for the current buffer"})
--

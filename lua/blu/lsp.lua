-- if true then return {} end

-- local binds_on_attach = function(client, bufnr)
--   local tablemerge = function(a, b)
--     local merged_table = {}
--     for i in pairs(a) do
--       merged_table[i] = b[i] or a[i]
--     end
--     for i in pairs(b) do
--       merged_table[i] = a[i] or b[i]
--     end
--     return merged_table
--   end
--
--   local opts = { buffer = bufnr, remap = false }
--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "]d", function()
--     vim.diagnostic.jump({ count = 1 })
--     vim.cmd("norm zzzv")
--
--   end, opts)
--   vim.keymap.set("n", "[d", function()
--     vim.diagnostic.jump({ count = -1 })
--     vim.cmd("norm zzzv")
--   end, opts)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end
--
-- [Global options]
-- Disable inlay hints
vim.lsp.inlay_hint.enable(false)

-- vim.lsp.config('*', {
--   root_markers = { '.git', '.hg' },
--   -- on_attach = binds_on_attach,
--   capabilities = require('blink.cmp').get_lsp_capabilities()
-- })
--
-- -- [Lua LS]
-- vim.lsp.config['luals'] = {
--   cmd = { 'lua-language-server' },
--   filetypes = { 'lua' },
--   root_markers = { '.luarc.json', '.luarc.jsonc' },
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--     },
--   },
-- }

vim.lsp.enable('luals')

-- [Clangd]
vim.lsp.config['clangd'] = {
  cmd = { 'clangd' },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c' },
}

vim.lsp.enable('clangd')

-- [Zig Language server]
vim.lsp.config['zls'] = {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zon' },
  root_markers = { 'build.zig' },
  settings = {
    zls = {
      semantic_tokens = "partial",
    },
  },
}

vim.g.zig_fmt_parse_errors = 1

vim.lsp.enable('zls')

-- [Texlab]
vim.lsp.config('texlab', {
  filetypes = { 'tex', 'plaintex' },
  settings = {
    ['texlab'] = {},
  }
})

vim.lsp.enable('texlab')

-- [Bash Language Server]
vim.lsp.config['bashls'] = {
  filetypes = { 'bash', 'sh', 'zsh' },
  root_markers = { ".git", ".editorconfig", ".bashrc" }
}

vim.lsp.enable('bashls')

--Systemd-language-server
vim.lsp.config['systemd_lsp'] = {
  cmd = { 'systemd-language-server' },
  filetypes = { 'systemd' },
}

vim.lsp.enable('systemd_lsp')

vim.lsp.enable('pyright')

vim.lsp.config('marksman', {
  filetypes = { 'markdown' },
  cmd = { 'marksman' },
  root_markers = { '.marksman.toml' }
})
vim.lsp.config['gopls'].filetypes = {'go'}
vim.lsp.enable('gopls')

vim.lsp.enable('marksman')
vim.lsp.enable('taplo')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('sqls')

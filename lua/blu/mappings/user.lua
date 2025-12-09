---@module "which-key"
local wk = require("which-key")

wk.add({
  mode = {"v"},
  {"J",":m '>+1<CR>gv=gv", desc = "Swap selection with line below."},
  {"K", ":m '<-2<CR>gv=gv",desc = "Swap selection with line above."}
})

wk.add({
  mode = {"n"},
  {"<leader>TT","<CMD>ToggleFloatTerm<CR>", desc = "ToggleFloatTerm"},
  {"J","mzJ`z", desc = "Join with line below"},
  {"n","nzzzv", desc = "center on next match"},
  {"N","Nzzzv", desc = "center on previous match"},
  {"<C-d>","<C-d>zz", desc = "screen center move down"},
  {"<C-u>","<C-u>zz", desc = "screen center move up"},
  {"<C-o>","<C-o>zzzv", desc = "center on older jump"},
  {"<C-i>","<C-i>zzzv", desc = "center on newer jump"},
  {"<C-[","<C-[>zzzv", desc = "center on definition of word"},
  {"<C-c>","<CMD>noh<CR>", desc = "clear highlights"},
  {"<leader>er",function ()
    vim.lsp.stop_client(vim.lsp.get_clients())
    vim.cmd([[
    write
    edit
    ]])
  end, desc = "reload buffer, including lsps"},
  {"<leader>ee", function()
    vim.cmd('write')
    vim.cmd('edit')
  end, desc="save and refresh buffer"},
})

wk.add({
  mode = {"t"},
  {"<Esc><Esc>","<C-\\><C-n>", desc = "leave terminal mode"},
})

wk.add({
  mode = {"n","v"},
  {"<leader>y","\"+y", desc = "[y]ank to system clipboard"},
  {"<leader>Y","\"+Y", desc = "[Y]ank to system clipboard"},
  {"<leader>pp","\"+p", desc = "[p]ut from system clipboard"},
  {"<leader>pP","\"+P", desc = "[P]ut from system clipboard"},
  {"<leader>d","\"_d", desc = "[d]elete without saving to register" },
  {"<A-a>","<C-a>", desc = "Add"},
  {"<A-x>","<C-x>", desc = "Subtraction"}
})



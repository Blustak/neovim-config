---@module 'which-key'
local wk = require("which-key")

---@module 'fzf-lua'
local fzf = require("fzf-lua")

wk.add({
  mode = { "n", "v", "i" },
  { "<F1>", fzf.helptags, desc = "search helptags" },
  { "<F3>", fzf.keymaps, desc = "keymaps"}
})
--file searching
wk.add({
  mode = { "n" },
  { "<leader>p",  group = "fzf files" },
  {"<leader>pg", group = "fzf git"},
  { "<leader>pgf", fzf.git_files,      desc = "fuzzy search git files" },
  { "<leader>pgb", fzf.git_branches, desc = "fzf git branches"},
  { "<leader>pgg", fzf.git_worktrees, desc = "fzf git worktrees"},
  { "<leader>po", fzf.oldfiles,       desc = "fuzzy search old files" },
  {
    "<leader>ph",
    function()
      fzf.files({
        cwd = "$HOME",
        hidden = false,
        actions = {
          ["alt-i"] = fzf.actions.toggle_hidden
        }
      })
    end,
    desc = "fuzzy search home dir"
  },
  {
    "<leader>pz",
    function()
      fzf.zoxide({
        actions = {
          ["enter"] = function(selected, opts)
            fzf.actions.zoxide_cd(selected, opts)
            require("oil").open(vim.fn.getcwd())
          end,
          ["ctrl-t"] = function(selected, opts)
            fzf.actions.zoxide_cd(selected, opts)
            vim.cmd("tabe .")
          end,
          ["ctrl-s"] = function(selected, opts)
            fzf.actions.zoxide_cd(selected, opts)
            vim.cmd("split +Oil")
          end,
          ["ctrl-v"] = function(selected, opts)
            fzf.actions.zoxide_cd(selected, opts)
            vim.cmd("vsplit +Oil")
          end
        }
      })
    end,
    desc = "zoxide to dir, cd and open oil"
  },
  {
    "<leader>pp",
    function()
      fzf.files({ cwd = vim.fn.getcwd() })
    end,
    desc = "fuzzy search for files"
  },
  { "<leader>pf", fzf.global,     desc = "fzflua global" },
  { "<leader>pk", fzf.builtins,   desc = "fzflua builtins" },
  { "<leader>pb", fzf.buffers,    desc = "fuzzy search buffers" },
  { "<leader>ps", fzf.treesitter, desc = "fuzzy search treesitter [s]ymbols" },
  { "<leader>pt", fzf.tabs,       desc = "fuzzy search tabs" },
  { "<leader>pl", fzf.lines,      desc = "fuzzy search lines" }
})


wk.add({
  mode = {"n"},
  {"<leader>f", group = "FzfLua search"},
  {"<leader>ff", fzf.lgrep_curbuf, desc = "lgrep curbuf"},
  {"<leader>fw", fzf.grep_cword, desc = "grep for word under cursor"},
  {"<leader>fp",fzf.grep_project, desc = "grep proj"},
  {"<leader>fg", fzf.grep, desc = "fzf grep"},
  {"<leader>fl", fzf.live_grep, desc = "live grep"},
  {"<leader>ft", fzf.btags, desc = "search buffer tags"},
  {"<leader>fT", fzf.tags, desc = "search tags"},
  {"<leader>fm",fzf.manpages, desc = "fzf manpages"},
  {"<leader>fh", fzf.helptags, desc = "fzf helptags"}
})

wk.add({
  mode = {"n","v"},
  {"<leader>aa", fzf.lsp_code_actions}
})

wk.add({
  mode = {"v"},
  {"<leader>fw", fzf.grep_visual}
})

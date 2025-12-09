
local fzf = require("fzf-lua")

fzf.setup({
  zoxide = {
    cmd = "zoxide query --list --score",
    git_root = false,
    formatter = "path.dirname_first",
    fzf_opts = {
      ["--no-multi"] = true,
      ["--delimiter"] = "[\t]",
      ["--tabstop"] = 4,
      ["--tiebreak"] = "end,index",
      ["--nth"] = "2..",
    },
  },
})

fzf.register_ui_select()


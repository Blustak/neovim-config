---@module 'oil'
local oil = require("oil")
---

---@module 'which-key'
local wk = require("which-key")

wk.add({
  mode = {"n"},
  {"-", oil.open, desc = "open oil"}
})

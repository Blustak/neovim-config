local wk = require("which-key")
wk.add({
  mode = {"n"},
  {"<leader>ww", function ()
    wk.show({
      loop=true,
    })
  end, desc = "open whichkey"},

})

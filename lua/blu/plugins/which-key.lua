return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    keys = {
      scroll_down = "<Down>",
      scroll_up = "<Up>",
    }
  },
  keys = {
    {
      "<leader>?",
      function ()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

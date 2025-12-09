local M = {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    enabled = function(bufnr)
      return true
    end,
    disable_in_macro = true,
    disable_filetype = {
      "fzf",
    },
  }
}

return M

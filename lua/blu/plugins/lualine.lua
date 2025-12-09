
local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
  opts = {
    extensions = {
      'lazy',
      'oil',
      'trouble'
    },
  }
}


-- local colors = {
--   black = '#1d202f',
--   red = '#f7768e',
--   green = '#9ece6a',
--   yellow = '#e0af68',
--   blue = '#7aa2f7',
--   purple = '#bb9af7',
--   lightblue = '#7dcfff',
--   grey = '#24283b',
--   white = '#c0caf5',
--   inactivegrey = '#1d202f',
--   select_bg = '#364a82',
-- }

return M

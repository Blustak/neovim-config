-- if true then return end
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets', 'folke/lazydev.nvim', },
  version = '1.*',

  ---@module 'blink.cmp
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default',
    },
    cmdline = {
      keymap = { preset = 'inherit'},
    },

    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function (ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
                end,
                highlight = function (ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                end
            },
            kind = {
                highlight = function (ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                end
            }
          }
        },
      },
      documentation = { auto_show = false } },
      enabled = function() return not vim.tbl_contains({}, vim.bo.filetype) end,
    sources = {
      default = {
        'lsp', 'path', 'snippets', 'buffer'
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { "sources.default" }
}

---@module 'which-key'
local wk = require("which-key")

---@module 'gitsigns'
local gs = require("gitsigns")

-- Only exec on attach.
gs.setup {
  on_attach = function(bufnr)
    wk.add({
      mode = { "n" },
      {
        ']c',
        function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gs.nav_hunk('next')
          end
        end,
        desc = "Gitsigns next hunk"
      },
      {
        '[c',
        function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end,
        desc = "Gitsigns prev hunk"
      }
    })

    wk.add({
      mode = {"v"},
      {"<leader>h", group = "Gitsigns"},
      {"<leader>hs", function ()
        gs.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
      end, desc = "Stage selected hunk"}, {
      "<leader>hr", function()
        gs.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
      end, desc = "Reset selected hunk"
    }
    })

    wk.add({
      mode = {"n"},
      {"<leader>h", group = "Gitsigns"},
      {"<leader>hs", gs.stage_hunk, desc = "stage hunk"},
      {"<leader>hr", gs.reset_hunk, desc = "reset hunk"},
      {"<leader>hb", gs.stage_buffer, desc = "stage buffer"},
      {"<leader>hd", gs.reset_buffer, desc = "reset buffer"},
      {"<leader>hp", group = "preview..."},
      {"<leader>hpp", gs.preview_hunk, desc = "preview hunk"},
      {"<leader>hpi", gs.preview_hunk_inline, desc = "preview hunk inline"},
      {"<leader>hl", gs.blame_line, desc = "blame current line"},
      {"<leader>hf", gs.diffthis, desc = "diff this"},
      {"<leader>hq", gs.setqflist, desc = "set qf list"},
      {"<leader>hQ", function () gs.setqflist('all') end, desc = "set qf list (all)"},
      {"<leader>htl", gs.toggle_current_line_blame, desc = "toggle cline blame"},
      {"<leader>htw", gs.toggle_word_diff}
    })
    wk.add({
      mode = {'o', 'x'},
      {'ih', gs.select_hunk}
    })
  end
}

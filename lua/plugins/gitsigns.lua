return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '-' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Git Jump to Next Change' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Git Jump to Prev Change' })

        -- Actions
        -- Visual Mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Hunk Stage' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Hunk Reset' })
        -- Normal Mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Hunk Stage' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Hunk Stage Buffer' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Hunk Reset' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Hunk Reset Buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Hunk Undo Stage' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Hunk Preview' })
        map('n', '<leader>hl', gitsigns.blame_line, { desc = 'Hunk Line Information' })
        map('n', '<leader>hi', gitsigns.diffthis, { desc = 'Hunk Diff Against Index' })
        map('n', '<leader>hc', function()
          gitsigns.diffthis '@'
        end, { desc = 'Hunk Diff Against Last Commit' })
        -- Toggles
        map('n', '<leader>hL', gitsigns.toggle_current_line_blame, { desc = 'Hunk Commit Information' })
        map('n', '<leader>hD', gitsigns.toggle_deleted, { desc = 'Hunk Toogle Deleted' })
      end,
    },
  },
}

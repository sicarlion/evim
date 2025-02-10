local bind = vim.keymap.set

vim.keymap.set('n', '<Escape>', function()
  local nvim_tree = require 'nvim-tree.api'
  if nvim_tree.tree.is_visible() then
    nvim_tree.tree.close()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cmd>nohlsearch<CR><Esc>', true, false, true), 'n', true)
  end
end, { noremap = true, silent = true })
bind('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

bind('n', '<leader>gq', vim.diagnostic.setloclist, { desc = 'Goto Quickfix List' })

bind('n', '<left>', '<cmd>echo "Arrow is disabled. Use <h> instead."<CR>')
bind('n', '<right>', '<cmd>echo "Arrow is disabled. Use <l> instead."<CR>')
bind('n', '<up>', '<cmd>echo "Arrow is disabled. Use <k> instead."<CR>')
bind('n', '<down>', '<cmd>echo "Arrow is disabled. Use <j> instead."<CR>')
bind('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
bind('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
bind('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
bind('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
bind('n', 'p', '"+p', { desc = 'Paste last yanked text' })
bind('n', 'P', '"+P', { desc = 'Paste last yanked text before cursor' })
bind('n', 'dp', '"1p', { desc = 'Paste last deleted text' })
bind('n', 'dP', '"1P', { desc = 'Paste last deleted text before cursor' })

-- Jawa

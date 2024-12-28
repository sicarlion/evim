local bind = vim.keymap.set

bind('n', '<Esc>', '<cmd>nohlsearch<CR>')
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

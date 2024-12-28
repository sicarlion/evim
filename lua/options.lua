vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.signcolumn = 'yes'
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

if vim.g.neovide then
  vim.api.nvim_set_keymap('v', '<sc-c>', '"+y', { noremap = true })
  vim.api.nvim_set_keymap('n', '<sc-v>', 'l"+P', { noremap = true })
  vim.api.nvim_set_keymap('v', '<sc-v>', '"+P', { noremap = true })
  vim.api.nvim_set_keymap('c', '<sc-v>', '<C-r>+', { noremap = true })
  vim.api.nvim_set_keymap('i', '<sc-v>', '<ESC>l"+Pli', { noremap = true })
  vim.api.nvim_set_keymap('t', '<sc-v>', '<C-\\><C-n>"+Pi', { noremap = true })

  vim.o.guifont = 'JetBrainsMono Nerd Font:h10'
  vim.g.neovide_scale_factor = 1
end

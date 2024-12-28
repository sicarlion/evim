return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>s', group = 'Search' },
        { '<leader>g', group = 'Goto', icon = { icon = '󰕲', color = 'blue' } },
        { '<leader>c', group = 'Code', icon = { icon = '', color = 'yellow' }, mode = { 'n', 'x' } },
        { '<leader>h', group = 'Hunk', icon = { icon = '', color = 'white' }, mode = { 'n', 'v' } },
      },
    },
  },
  {
    'mountain-theme/vim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'mountain'

      vim.cmd.hi 'Comment gui=none'

      -- Border of floating windows
      vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = 'Grey',
        bg = 'none',
      })
      -- Title of floating windows
      vim.api.nvim_set_hl(0, 'FloatTitle', {
        fg = 'Grey',
        bg = 'none',
      })
      -- Background color none
      vim.api.nvim_set_hl(0, 'Normal', {
        bg = '#0f0f0f',
      })
      vim.api.nvim_set_hl(0, 'NormalFloat', {
        bg = 'none',
      })
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  --  {
  --    'echasnovski/mini.nvim',
  --    config = function()
  --      require('mini.ai').setup { n_lines = 500 }
  --      require('mini.surround').setup()
  --
  --      local statusline = require 'mini.statusline'
  --
  --      statusline.setup { use_icons = vim.g.have_nerd_font }
  --
  --      statusline.section_location = function()
  --        return '%2l:%-2v'
  --      end
  --    end,
  --  },
}

require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {

    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {

        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {

      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
      },
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {

          ['<C-j>'] = cmp.mapping.select_next_item(),

          ['<C-k>'] = cmp.mapping.select_prev_item(),

          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ['<C-l>'] = cmp.mapping.confirm { select = true },

          ['<C-Space>'] = cmp.mapping.complete {},

          ['<C-m>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-n>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          {
            name = 'lazydev',

            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { import = 'plugins' },
}

local colors = {
  cyan = '#8aacab',
  black = '#080808',
  white = '#c6c6c6',
  orange = '#c6a679',
  green = '#8aac8b',
  grey = '#303030',
}

local nezu = {
  normal = {
    a = { fg = colors.black, bg = colors.white },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.orange } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = nezu,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { {
      'mode',
      fmt = function(str)
        return str:sub(1, 1) .. str:lower():sub(2, 99)
      end,
      right_padding = 2,
    } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=',
    },
    lualine_x = {},
    lualine_y = { {
      'filetype',
      fmt = function(str)
        return str:upper():sub(1, 1) .. str:sub(2, 99)
      end,
    }, 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

require('mini.starter').setup {
  autoopen = true,
  evaluate_single = false,
  items = nil,
  header = nil,
  footer = "Ready for bug hunting? Let's go!",
  content_hooks = nil,
  query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
  silent = false,
}

require('neocord').setup {
  logo = 'auto',
  logo_tooltip = nil,
  main_image = 'language',
  client_id = '1157438221865717891',
  log_level = nil,
  debounce_timeout = 10,
  blacklist = {},
  file_assets = {},
  show_time = true,
  global_timer = true,

  editing_text = 'Editing %s',
  file_explorer_text = 'Browsing %s',
  git_commit_text = 'Committing changes',
  plugin_manager_text = 'Managing plugins',
  reading_text = 'Reading %s',
  workspace_text = 'Working on %s',
  line_number_text = 'Line %s out of %s',
  terminal_text = 'Using Terminal',
}

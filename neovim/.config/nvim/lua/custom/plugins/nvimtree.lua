return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require('nvim-tree').setup {
      git = {
        ignore = false,
      },
      filters = {
        dotfiles = false,
      },
      view = {
        side = 'right',
        width = 40,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    }

    vim.keymap.set('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>')

    local view = require 'nvim-tree.view'
    local api = require 'nvim-tree.api'
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    -- save nvim-tree window width on WinResized event
    augroup('save_nvim_tree_width', { clear = true })
    autocmd('WinResized', {
      group = 'save_nvim_tree_width',
      pattern = '*',
      callback = function()
        local filetree_winnr = view.get_winnr()
        if filetree_winnr ~= nil and vim.tbl_contains(vim.v.event['windows'], filetree_winnr) then
          vim.t['filetree_width'] = vim.api.nvim_win_get_width(filetree_winnr)
        end
      end,
    })

    -- restore window size when openning nvim-tree
    api.events.subscribe(api.events.Event.TreeOpen, function()
      if vim.t['filetree_width'] ~= nil then
        view.resize(vim.t['filetree_width'])
      end
    end)
  end,
}

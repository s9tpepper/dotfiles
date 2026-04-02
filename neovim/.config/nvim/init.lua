--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========     /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
-- Change the color of the cursor line
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#151515' })
vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight CursorLine guibg=#151515 ctermbg=NONE]],
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Save the buffer
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save the buffer' })

-- Yank entire buffer into clipboard
vim.keymap.set('n', '<C-c>', '<Cmd>%y+<CR>', { desc = 'Yank entire buffer' })

-- Enable max line length column
vim.api.nvim_set_option_value('colorcolumn', '120', {
  scope = 'global',
})

-- Set Tabs width settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- vim.cmd[[highlight YankColor ctermfg=NONE ctermbg=NONE guibg=#3333FF guifg=#00FFFF]]
-- vim.cmd [[highlight YankColor ctermfg=NONE ctermbg=NONE guibg=#3333FF guifg=#FF0000]]
-- guifg=#282737 guibg=#f8bd96

-- vim.api.nvim_set_hl(0, 'YankColor', { bg = '#00FF00' })
--
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight yanked text during N milliseconds',
--   command = "lua vim.highlight.on_yank({timeout=250,higroup='YankColor'})",
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank {
--       higroup = 'IncSearch',
--     }
--   end,
-- })

-- NOTE: This works here to change yank color
vim.api.nvim_set_hl(0, 'YankColor', { bg = '#3333FF', fg = '#00FFFF' })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text during N milliseconds',
  command = "lua vim.highlight.on_yank({timeout=250,higroup='YankColor'})",
})

-- TODO: Figure out why this doesn't work here, but works in catppuccin config
--
-- Change the color of the visual selection
local hl_group = 'Visual'
vim.api.nvim_set_hl(0, hl_group, {
  -- bg = '#9900FF',
  -- fg = '#FFFF66',
  bg = '#ffff88',
  fg = '#222222',
  reverse = false,

  blend = 10,
  nocombine = false,
  bold = false,
  ctermfg = 'black',
  ctermbg = 'yellow',
  standout = false,
  italic = false,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local function require_directory_files(directory_path, module_prefix)
  -- Read all .lua files in the directory
  local files = vim.fn.readdir(directory_path, [[v:val =~ '\.lua$']])

  if files then
    for _, file in ipairs(files) do
      -- Remove the '.lua' extension and combine with the module prefix
      local module_name = module_prefix .. '.' .. file:gsub('%.lua$', '')
      -- local module_name = file:gsub('%.lua$', '') .. '.lua'
      -- Require the module

      local ok, err = pcall(require, module_name)
      if not ok then
        vim.api.nvim_err_writeln('Failed to load module ' .. module_name .. ': ' .. err)
      end
    end
  end
end

local base_config_dir = vim.fn.stdpath 'config'
-- Used for local dev
--local base_config_dir = vim.fn.expand '/home/s9tpepper/documents/github/s9tpepper/dotfiles/neovim/.config/nvim'

-- local base_config_dir = vim.fn.expand '/home/s9tpepper/documents/github/s9tpepper/dotfiles/neovim/.config/nvim'
-- local vimpack_config_dir = base_config_dir .. '/lua/vimpack'
-- print('vimpack_config_dir:' .. vimpack_config_dir)

-- Add to runtimepath AND package.path
vim.opt.rtp:prepend(base_config_dir)
package.path = base_config_dir .. '/lua/?.lua;' .. base_config_dir .. '/lua/?/init.lua;' .. package.path

local vimpack_config_dir = base_config_dir .. '/lua/vimpack'

-- Call the function to load all files in that directory as 'user.*' modules
require_directory_files(vimpack_config_dir, 'vimpack')

require 'after.after'

-- misc options
--
local border = require 'custom.configs.border'

-- let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
-- vim.nvim.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

-- vim.api.nvim_set_option_value('guicursor', 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20', {
--   scope = 'global',
-- })

vim.api.nvim_set_option_value('guicursor', 'n-v-c-i-sm:block-blinkwait700-blinkon300-blinkoff250,r-cr-o:hor20-blinkwait700-blinkon400-blinkoff250', {
  scope = 'global',
})

-- Enable max line length column
vim.api.nvim_set_option_value('colorcolumn', '120', {
  scope = 'global',
})

-- Add file types to languages
vim.filetype.add {
  filename = {
    ['Jenkinsfile'] = 'groovy',
  },
}

-- For the borders
vim.diagnostic.config {
  virtual_text = {
    prefix = '▲', -- Could be '●', '▎', 'x', '■', , 
    float = { border = border },
  },
}

vim.o.winborder = 'rounded'
vim.o.pumborder = 'rounded'

-- Set cmdheight to 0 for a truly floating command line
vim.o.cmdheight = 0

-- Enable experimental UI2
require('vim._core.ui2').enable {
  -- Optional configuration options
  enable = true,
  cmd = { height = 0.5 },
  msg = { height = 0.3, timeout = 5000 },
}

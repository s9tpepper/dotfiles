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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
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

local function has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

local function copy(obj, seen, omit)
  omit = omit or {}
  if type(obj) ~= 'table' then
    return obj
  end
  if seen and seen[obj] then
    return seen[obj]
  end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do
    if has_value(omit, k) == false then
      res[copy(k, s)] = copy(v, s)
    end
  end
  return res
end

local function add_doc_highlighting(buf)
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = buf,
    callback = vim.lsp.buf.document_highlight,
    -- NOTE: trying to get the callback to work with groovylsp
    -- callback = function()
    --   local client = vim.lsp.client()
    --   if client.name ~= 'groovyls' then
    --     print 'returning document_highlight'
    --     -- vim.lsp.buf.document_highlight()
    --     return true
    --   end
    --   print 'not returning document_highlight'
    --   return false
    -- end,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = buf,
    callback = vim.lsp.buf.clear_references,
    -- callback = function()
    --   local client = vim.lsp.client()
    --   if client.name ~= 'groovyls' then
    --     -- vim.lsp.buf.clear_references()
    --   end
    -- end,
  })
end

local function setup_rustaceanvim(capabilities)
  vim.g.rustaceanvim = function()
    -- Update this path
    -- local extension_path = vim.env.HOME .. '~/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    -- local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    -- local liblldb_path = extension_path .. '/usr/bin/lldb'
    local liblldb_path = '/usr/bin/lldb'
    local this_os = vim.uv.os_uname().sysname

    -- The path is different on Windows
    if this_os:find 'Windows' then
      codelldb_path = extension_path .. 'adapter\\codelldb.exe'
      liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
    else
      -- The liblldb extension is .so for Linux and .dylib for MacOS
      liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')
    end

    local cfg = require 'rustaceanvim.config'

    return {
      tools = {
        hover_actions = {
          border = 'rounded',
          replace_builtin_hover = false,
        },
        float_win_config = {
          border = 'rounded',
        },
      },
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            check = {
              command = 'clippy',
            },
          },
        },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- vim.g.rustaceanvim.tools.float_win_config.border = 'rounded'

          vim.keymap.set('n', '<leader>vca', function()
            vim.cmd.RustLsp 'codeAction'
          end, { buffer = bufnr, desc = 'Show code actions' })

          vim.cmd.RustLsp 'renderDiagnostic'

          if client.server_capabilities.documentHighlightProvider then
            add_doc_highlighting(bufnr)
          end

          vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
          vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
        end,
      },
    }
  end
end

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `conform.nvim`. This is equivalent to:
  --    require('conform').setup({ ... })
  --
  -- See `:help conform` to understand what the configuration keys do
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VeryLazy'
  --
  -- which loads which-key after all the UI elements are loaded. Events can be
  -- normal autocommands events (:help autocomd-events).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
    config = function() -- This is the function that runs, AFTER loading
      -- require('which-key').setup()
      local wk = require 'which-key'

      -- Document existing key chains
      wk.add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
        { '<leader>x', group = '[X]Trouble' },
        { '<leader>x_', hidden = true },
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires special font.
      --  If you already have a Nerd Font, or terminal set up with fallback fonts
      --  you can enable this
      -- { 'nvim-tree/nvim-web-devicons' }
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          initial_mode = 'normal',
          layout_config = {
            bottom_pane = {
              height = 25,
              preview_cutoff = 120,
              prompt_position = 'top',
            },
            center = {
              height = 0.4,
              preview_cutoff = 40,
              prompt_position = 'top',
              width = 0.5,
            },
            cursor = {
              height = 0.9,
              preview_cutoff = 40,
              width = 0.8,
            },
            horizontal = {
              height = 0.9,
              preview_cutoff = 120,
              prompt_position = 'top',
              width = 0.8,
            },
            vertical = {
              height = 0.9,
              preview_cutoff = 40,
              prompt_position = 'top',
              width = 0.8,
            },
          },
          -- mappings = {
          --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          -- },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files {
          cwd = vim.fn.stdpath 'config',
        }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    -- NOTE: this inlay_hint setting is not working either nvim 0.9
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
      },
    },
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Lua LSP configs for the Neovim config, runtime, and plugins for completion,
      -- annotations, and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- NOTE: Customizations to lspconfig here:

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, :help lsp-vs-treesitter

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          -- map('<leader>ca', function()
          --   vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
          -- end, '[C]ode [A]ction')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- Show the signature of the function you're currently completing.
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- NOTE: Have to start Rustaceanvim here, doing so any later makes the LSP not start
          -- Moved capabilities creation to top of this callback so it is available to all LSPs
          setup_rustaceanvim(capabilities)

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- Inlay Hints
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>ih', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, 'Toggle [I]nlay [H]ints')
          end

          -- NOTE: move this on a per LSP basis
          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          -- This was in the Kickstart.nvim init.lua and I had to move it to be
          -- applied on a per LSP basis
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          -- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          --   buffer = event.buf,
          --   callback = vim.lsp.buf.document_highlight,
          --   -- NOTE: trying to get the callback to work with groovylsp
          --   -- callback = function()
          --   --   local client = vim.lsp.client()
          --   --   if client.name ~= 'groovyls' then
          --   --     print 'returning document_highlight'
          --   --     -- vim.lsp.buf.document_highlight()
          --   --     return true
          --   --   end
          --   --   print 'not returning document_highlight'
          --   --   return false
          --   -- end,
          -- })
          --
          -- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          --   buffer = event.buf,
          --   callback = vim.lsp.buf.clear_references,
          --   -- callback = function()
          --   --   local client = vim.lsp.client()
          --   --   if client.name ~= 'groovyls' then
          --   --     -- vim.lsp.buf.clear_references()
          --   --   end
          --   -- end,
          -- })
        end,
      })

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

      -- NOTE: This was coming from a handlers.lua config in custom.configs.handlers
      -- but the borders were working without it so I removed the file
      local handlers = {}

      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- If you use something like typescript, where the tooling is as bad as the language,
        -- then you might need to install and configure something like this:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- If you only have simple needs for typescript, then you can probably just use tsserver
        ts_ls = {
          handlers = handlers,
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentHighlightProvider then
              add_doc_highlighting(bufnr)
            end
          end,
          init_options = {
            preferences = {
              disableSuggestions = true,
            },
          },
          commands = {
            OrganizeImports = {
              organize_imports = function()
                local params = {
                  command = '_typescript.organizeImports',
                  arguments = { vim.api.nvim_buf_get_name(0) },
                }

                vim.lsp.buf.execute_command(params)
              end,
              description = 'Organize Imports',
            },
          },

          -- NOTE: inlay hints settings for tsserver is causing errors and the inlays dont work
          -- settings = {
          --   typescript = {
          --     inlayHints = {
          --       includeInlayParameterNameHints = 'all',
          --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --       includeInlayFunctionParameterTypeHints = true,
          --       includeInlayVariableTypeHints = true,
          --       includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          --       includeInlayPropertyDeclarationTypeHints = true,
          --       includeInlayFunctionLikeReturnTypeHints = true,
          --       includeInlayEnumMemberValueHints = true,
          --     },
          --   },
          --
          --   javascript = {
          --     inlayHints = {
          --       includeInlayParameterNameHints = 'all',
          --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --       includeInlayFunctionParameterTypeHints = true,
          --       includeInlayVariableTypeHints = true,
          --       includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          --       includeInlayPropertyDeclarationTypeHints = true,
          --       includeInlayFunctionLikeReturnTypeHints = true,
          --       includeInlayEnumMemberValueHints = true,
          --     },
          --   },
          -- },
        },

        dockerls = {
          filetypes = { 'Dockerfile' },
          capabilities = capabilities,
        },

        -- groovyls = {
        --   cmd = { 'java', '-jar', '/Users/omargonzalez/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar' },
        --   filetypes = { 'groovy', 'Jenkinsfile' },
        --   capabilities = capabilities,
        --   handlers = handlers,
        --   -- settings = {
        --   --   groovy = {},
        --   -- },
        -- },

        rust_analyzer = {
          handlers = handlers,
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentHighlightProvider then
              add_doc_highlighting(bufnr)
            end
          end,

          settings = {
            check = {
              command = 'clippy',
            },
          },
        },

        lua_ls = {
          handlers = handlers,
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentHighlightProvider then
              add_doc_highlighting(bufnr)
            end
          end,
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              hint = { enable = true },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },

        intelephense = {
          handlers = handlers,
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentHighlightProvider then
              add_doc_highlighting(bufnr)
            end
          end,
          settings = {
            intelephense = {
              format = {
                enable = false,
              },
              stubs = {
                'apache',
                'bcmath',
                'bz2',
                'calendar',
                'com_dotnet',
                'Core',
                'ctype',
                'curl',
                'date',
                'dba',
                'dom',
                'enchant',
                'exif',
                'FFI',
                'fileinfo',
                'filter',
                'fpm',
                'ftp',
                'gd',
                'gettext',
                'gmp',
                'hash',
                'iconv',
                'imap',
                'intl',
                'json',
                'ldap',
                'libxml',
                'mbstring',
                'meta',
                'mysqli',
                'oci8',
                'odbc',
                'openssl',
                'pcntl',
                'pcre',
                'PDO',
                'pdo_ibm',
                'pdo_mysql',
                'pdo_pgsql',
                'pdo_sqlite',
                'pgsql',
                'Phar',
                'posix',
                'pspell',
                'readline',
                'Reflection',
                'session',
                'shmop',
                'SimpleXML',
                'snmp',
                'soap',
                'sockets',
                'sodium',
                'SPL',
                'sqlite3',
                'standard',
                'superglobals',
                'sysvmsg',
                'sysvsem',
                'sysvshm',
                'tidy',
                'tokenizer',
                'xml',
                'xmlreader',
                'xmlrpc',
                'xmlwriter',
                'xsl',
                'Zend OPcache',
                'zip',
                'zlib',
                'wordpress',
                'phpunit',
              },
              diagnostics = {
                enable = true,
              },
            },
          },
        },

        graphql = {
          handlers = handlers,
          capabilities = capabilities,
          filetypes = { 'graphql', 'graphqlschema', 'ts', 'tsx', 'typescript', 'typescriptreact' },
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentHighlightProvider then
              add_doc_highlighting(bufnr)
            end
          end,
        },
      }

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
        'js-debug-adapter',
        -- 'eslint-lsp',
        'eslint_d',
        'prettier',
        -- 'typescript-language-server',
        -- 'gopls',
        'js-debug-adapter',
        'json-lsp',
        'graphql-language-service-cli',
        'lua-language-server',
        'prettierd',
        'python-lsp-server',
        'tailwindcss-language-server',
        'terraform-ls',
        -- 'groovy-language-server',
        'dockerls',
        -- 'rust-analyzer',
        'intelephense',
        -- 'phpstan',
        -- 'phpactor',
        'phpcs',
        'php-cs-fixer',
      })

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(server_name)
            -- Skip rust_analyzer to rustaceanvim can do its thing
            if server_name ~= 'rust_analyzer' then
              local server = servers[server_name] or {}

              require('lspconfig')[server_name].setup {
                cmd = server.cmd,
                handlers = handlers,
                settings = server.settings,
                filetypes = server.filetypes,
                -- This handles overriding only values explicitly passed
                -- by the server configuration above. Useful when disabling
                -- certain features of an LSP (for example, turning off formatting for tsserver)
                capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
                on_attach = server.on_attach,
              }
            end
          end,
        },
      }

      -- Add file types to languages
      vim.filetype.add {
        filename = {
          ['Jenkinsfile'] = 'groovy',
        },
      }
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'onsails/lspkind.nvim',
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`

      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      local lspkind = require 'lspkind'
      lspkind.init {}

      cmp.setup {
        formatting = {
          fields = { 'abbr', 'menu', 'kind' },
          expandable_indicator = true,
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            kind.kind = ' ' .. (strings[1] or '') .. ' '
            kind.menu = '    (' .. (strings[2] or '') .. ')'

            return kind
          end,
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        completion = { completeopt = 'menu,menuone,noinsert' },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  --   'folke/tokyonight.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- Load the colorscheme here
  --     vim.cmd.colorscheme 'tokyonight-night'
  --
  --     -- You can configure highlights by doing something like
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- require('mini.statusline').setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'c',
          'lua',
          'vim',
          'vimdoc',
          'html',
          'css',
          'javascript',
          'typescript',
          'tsx',
          'json',
          'vue',
          'bash',
          'dockerfile',
          'groovy',
          'xml',
          'yaml',
          'php',
        },
        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional plugins for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'custom.plugins' },
}, {})

-- -- TODO: Figure out which plugin is overriding this setting
-- vim.api.nvim_set_hl(0, 'YankColor', { bg = '#3333FF', fg = '#00FFFF' })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight yanked text during N milliseconds',
--   command = "lua vim.highlight.on_yank({timeout=250,higroup='YankColor'})",
-- })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--

require 'after.after'

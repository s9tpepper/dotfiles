vim.pack.add({
  'https://github.com/L3MON4D3/LuaSnip',
}, {
  build = (function()
    -- Build Step is needed for regex support in snippets
    -- This step is not supported in many windows environments
    -- Remove the below condition to re-enable on windows
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
})

vim.pack.add {
  'https://github.com/onsails/lspkind.nvim',
  'https://github.com/saadparwaiz1/cmp_luasnip',

  -- Adds other completion capabilities.
  --  nvim-cmp does not ship with all sources by default. They are split
  --  into multiple repos for maintenance purposes.
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-path',

  -- If you want to add a bunch of pre-configured snippets,
  --    you can use this plugin to help you. It even has snippets
  --    for various frameworks/libraries/etc. but you will have to
  --    set up the ones that are useful for you.
  -- 'rafamadriz/friendly-snippets',
}

vim.pack.add({ 'https://github.com/hrsh7th/nvim-cmp' }, {
  event = 'InsertEnter',
})

-- See `:help cmp`

local luasnip = require 'luasnip'
luasnip.config.setup {}

local lspkind = require 'lspkind'
lspkind.init {}

local cmp = require 'cmp'
cmp.setup({
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
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    completion = {
      border = 'rounded',
    },

    documentation = {
      border = 'rounded',
    }
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
})

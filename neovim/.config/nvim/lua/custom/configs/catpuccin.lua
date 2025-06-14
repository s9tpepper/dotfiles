return {
  require('catppuccin').setup {
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { 'italic' }, -- Change the style of comments
      conditionals = { 'italic' },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      harpoon = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
      neogit = true,
      dap = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      lsp_trouble = true,
      mason = true,
      -- lualine = true,
    },
  },

  vim.cmd.colorscheme 'catppuccin',

  -- -- TODO: Figure out how to move these into Catpuccin configs
  --
  -- vim.cmd[[highlight YankColor ctermfg=NONE ctermbg=NONE guibg=#3333FF guifg=#00FFFF]],

  -- -- Change Visual mode selected text color
  -- local hl_group = 'Visual'
  vim.api.nvim_set_hl(0, 'Visual', {
    -- fg = '#9900FF',
    -- bg = '#FFFF66',
    fg = '#ffff89',
    bg = '#222222',
    reverse = true,
    blend = 10,
    nocombine = false,
    bold = false,
    standout = false,
    italic = false,
  }),
}

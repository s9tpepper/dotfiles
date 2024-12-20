local border = require 'custom.configs.border'

-- let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
-- vim.nvim.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

vim.api.nvim_set_option_value('guicursor', 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20', {
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

return {}

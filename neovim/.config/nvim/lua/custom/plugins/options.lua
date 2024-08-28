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
-- vim.diagnostic.config {
--   virtual_text = {
--     prefix = '● ', -- Could be '●', '▎', 'x', '■', , 
--     float = { border = border },
--   },
-- }

vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
  config = config or { border = 'rounded', focusable = true }
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end

  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.tbl_filter(function(line)
    return line ~= ''
  end, markdown_lines)

  if vim.tbl_isempty(markdown_lines) then
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
end

return {}

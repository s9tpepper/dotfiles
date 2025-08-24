local signs = {
  Error = '',
  -- Warn = '󰻷',
  -- Warn = '',
  Warn = '󱨊',
  Hint = '',
  Info = '󰙎',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Dynamic diagnostic border colors

local function get_diagnostic_border_color(bufnr)
  -- current line (0-indexed)
  local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1

  local diagnostics = vim.diagnostic.get(bufnr or 0, { lnum = current_line })
  for _, d in ipairs(diagnostics) do
    if d.severity == vim.diagnostic.severity.ERROR then
      return '#ff5555' -- red for errors
    end
  end
  -- no errors, maybe warnings exist
  if #diagnostics > 0 then
    return '#ffca66' -- orange for warnings
  end
  return '#A0A0A0' -- default/neutral color
end

vim.diagnostic.open_float(nil, {
  border = 'rounded',
  format = function(d)
    return '\n' .. d.message .. '\n' -- add top/bottom padding
  end,
})

local function open_diagnostic_float()
  local color = get_diagnostic_border_color()

  vim.api.nvim_set_hl(0, 'DiagnosticBorderColor', {
    fg = color,
    bg = '',
    bold = true,
  })

  vim.diagnostic.open_float(nil, {
    border = {
      { '╭', 'DiagnosticBorderColor' },
      { '─', 'DiagnosticBorderColor' },
      { '╮', 'DiagnosticBorderColor' },
      { '│', 'DiagnosticBorderColor' },
      { '╯', 'DiagnosticBorderColor' },
      { '─', 'DiagnosticBorderColor' },
      { '╰', 'DiagnosticBorderColor' },
      { '│', 'DiagnosticBorderColor' },
    },
    header = '',
    prefix = '',
  })
end

--vim.keymap.set('n', '<leader>d', open_diagnostic_float)

vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
  vim.defer_fn(open_diagnostic_float, 20)
end, { desc = 'Go to previous diagnostic and show float' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next()
  vim.defer_fn(open_diagnostic_float, 20)
end, { desc = 'Go to next diagnostic and show float' })

return {}

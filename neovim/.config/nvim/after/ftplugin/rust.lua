vim.keymap.set('n', '<leader>dr', function()
  vim.cmd.RustLsp 'relatedDiagnostics'
end)

-- vim.keymap.set('n', '<leader>vca', function()
--   vim.cmd.RustLsp 'codeAction'
-- end, { buffer = bufnr, desc = 'Show code actions' })
-- vim.cmd.RustLsp 'renderDiagnostic'

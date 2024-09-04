return {
  'mistricky/codesnap.nvim',
  build = 'make',
  keys = {
    { '<leader>csc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    { '<leader>css', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    { '<leader>csh', '<cmd>CodeSnapSaveHighlight<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
  },
  opts = {
    save_path = '~/Pictures',
    has_breadcrumbs = true,
    bg_theme = 'bamboo',
  },
}

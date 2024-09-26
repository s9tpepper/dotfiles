return {
  'mistricky/codesnap.nvim',
  lazy = false,
  build = 'make',
  keys = {
    { '<leader>csc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    { '<leader>css', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    { '<leader>csh', '<cmd>CodeSnapSaveHighlight<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
  },
  opts = {
    save_path = '~/Pictures',
    has_breadcrumbs = true,
    code_font_family = 'BerkeleyMono Nerd Font Mono',
    has_line_number = true,
    bg_x_padding = 60,
    bg_y_padding = 60,
    bg_theme = 'grape',
  },
}

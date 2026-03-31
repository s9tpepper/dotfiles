vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/s9tpepper/searchfox-nvim',
}

require('searchfox').setup {
  local_path = '/Users/ogonzalez/Documents/code/github/mozilla/firefox',
  default_action = 'local',
}
require('telescope').load_extension 'searchfox'

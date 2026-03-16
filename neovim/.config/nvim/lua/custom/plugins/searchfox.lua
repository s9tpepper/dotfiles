return {
  's9tpepper/searchfox-nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    local_path = '/Users/ogonzalez/Documents/code/github/mozilla/firefox',
    default_action = 'local',
  },
  config = function(_, opts)
    require('searchfox').setup(opts)
    require('telescope').load_extension 'searchfox'
  end,
}

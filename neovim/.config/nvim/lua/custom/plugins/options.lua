-- Enable max line length column
vim.api.nvim_set_option_value("colorcolumn", "120", {
  scope = "global"
})

-- Add file types to languages
vim.filetype.add({
  filename = {
    ['Jenkinsfile'] = 'groovy'
  }
})

return {}


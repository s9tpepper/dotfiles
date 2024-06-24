local border = require 'custom.configs.border'

vim.disagnostic.config {
  virtual_text = {
    prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    float = { border = border },
  },
}

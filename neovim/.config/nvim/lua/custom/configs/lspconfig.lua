local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local function organize_imports ()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)}
  }

  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

lspconfig.gopls.setup {
  on_attach = on_attach,
}

lspconfig.groovyls.setup {
  cmd = { "java", "-jar", "/Users/omargonzalez/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar" },
  on_attach = on_attach,
  filetypes = { "groovy", "Jenkinsfile" },
  settings = {
    groovy = {
    }
  }
}

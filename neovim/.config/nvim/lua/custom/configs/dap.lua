local dap = require 'dap'

dap.adapters['pwa-node'] = {
  type = 'server',
  host = '127.0.0.1',
  port = 8123,
  executable = {
    command = 'js-debug-adapter',
  },
}

dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode',
  name = 'lldb',
}

dap.adapters.codelldb = {
  type = 'executable',
  command = '/Users/omargonzalez/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb',
  name = 'codelldb',
}

for _, language in ipairs { 'typescript', 'javascript' } do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
      runtimeExecutable = 'node',
    },
  }
end

dap.configurations.rust = {
  {
    name = 'ratatatat-codelldb',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.getcwd() .. '/target/debug/ratatatat'
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  {
    name = 'ratatatat-lldb',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.getcwd() .. '/target/debug/ratatatat'
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  -- {
  --   -- ... the previous config goes here ...,
  --   initCommands = function()
  --     -- Find out where to look for the pretty printer Python module
  --     local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
  --
  --     local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
  --     local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
  --
  --     local commands = {}
  --     local file = io.open(commands_file, 'r')
  --     if file then
  --       for line in file:lines() do
  --         table.insert(commands, line)
  --       end
  --       file:close()
  --     end
  --     table.insert(commands, 1, script_import)
  --
  --     return commands
  --   end,
  --   -- ...,
  -- },
}

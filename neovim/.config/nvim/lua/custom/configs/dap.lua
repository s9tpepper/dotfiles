local dap = require 'dap'

dap.adapters['pwa-node'] = {
  type = 'server',
  host = '127.0.0.1',
  port = 8123,
  executable = {
    command = 'js-debug-adapter',
  },
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

dap.adapters.codelldb = {
  type = 'executable',
  command = '/home/s9tpepper/.local/share/nvim/mason/bin/codelldb',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
  },
  name = 'godot_rust',
}

dap.configurations.rust = {
  {
    name = 'godot_rust',
    type = 'codelldb',
    request = 'attach',
    pid = function()
      return require('dap.utils').pick_process { filter = 'godot' }
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    sourceLanguages = { 'rust' },
  },
  -- {
  --   name = 'ratatatat-codelldb',
  --   type = 'codelldb',
  --   request = 'launch',
  --   program = function()
  --     return vim.fn.getcwd() .. '/target/debug/ratatatat'
  --   end,
  --   cwd = '${workspaceFolder}',
  --   stopOnEntry = false,
  -- },
  -- {
  --   name = 'tui-scrollview',
  --   type = 'codelldb',
  --   request = 'launch',
  --   program = function()
  --     return vim.fn.getcwd() .. '/target/debug/ratatatat'
  --   end,
  --   cwd = '${workspaceFolder}',
  --   stopOnEntry = false,
  -- },
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

local ok, dap = pcall(require, "dap")

if not ok then
    return
end

dap.adapters.python = {
    type = 'executable';
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/debugpy/debugpy-adapter';
}
dap.configurations.python = {{
    type = 'python';
    request = 'launch';
    name = 'Launch File';
    program = '${file}';
    pythonPath = function ()
        return '/usr/bin/python3'
    end;
    },
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/bin/gdb',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp

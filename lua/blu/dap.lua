local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-dap',
  name = 'lldb'
}

dap.adapters.delve = function (callback, config)
  if config.mode =='remote' and config.request =='attach' then
    callback({
      type = 'server',
      host = config.host or '127.0.0.1',
      port = config.port or '38697'
    })
  else
    callback({
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap'},
        detached = vim.fn.has("win32") == 0
      }
    })
  end
end


dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {}
  }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


dap.configurations.go = {
  {
    name = "Debug",
    type = 'delve',
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}

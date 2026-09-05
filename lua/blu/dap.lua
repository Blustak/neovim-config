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

local dap_binds = {
  {"<leader>bb", dap.toggle_breakpoint, desc = 'toggle breakpoint'},
  {"<leader>bc", dap.continue, desc = 'continue'},
  {"<leader>bt", dap.repl.open, desc = 'open repl'},
  {"<leader>baa", function() require('dap.ui.widgets').hover() end, desc = "hover widget"},
  {"<leader>bp", function() require('dap.ui.widgets').preview() end, desc = "preview widget", mode = {'n','v'}}
}

local add_binds = function()
  local wk = require("which-key")
  wk.add({"<leader>b", group = "dap binds"})
  for k,v in pairs(dap_binds) do
    wk.add(v)
  end
end

local rem_binds = function(buf)
  local unset_bind = function(v,b)
    local mode = v.mode
    if not b then
      buf = 0
    end
    if not v.mode then
      mode = {'n','i','t','v'}
    end
    vim.keymap.del(mode,v[1],{buf = buf})
  end
  for k, v in ipairs(dap_binds) do
    unset_bind(v,b)
  end
end

dap.listeners.after['event_initialized']['user_binds'] = function(session, body)
  add_binds()
end

dap.listeners.after['event_terminated']['user_binds'] = function(session, body)
  rem_binds()
end

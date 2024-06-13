local dap = require("dap")
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command =
    "/home/shahabaz/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb",
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}
dap.configurations.cpp = {
  {
    name = "Launch file lldb",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = function()
      return vim.fn.input("WorkingDir: ", vim.fn.getcwd() .. "/", "dir")
    end,
    stopOnEntry = false,
  },
  {
    name = "Launch gdb",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = function()
      return vim.fn.input("WorkingDir: ", vim.fn.getcwd() .. "/", "dir")
    end,
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Attach to gdbserver native",
    type = "gdb",
    request = "attach",
    executable = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,

    target = function()
      local user_input = vim.fn.input("target ip and port: 'ip:port' ")
      return tostring(user_input)
    end,
    remote = true,
    cwd = "${workspaceRoot}",
  },
  {
    name = "Launch file cppdbg",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
  },
  {
    name = "Attach to gdbserver cppdbg",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = function()
      local user_input = vim.fn.input("target ip and port: 'ip:port' ")
      return tostring(user_input)
    end,
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}

-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "chadracula",
  transparency = true,
}

-- enable custom plugins
M.plugins = "custom.plugins"

-- enable custom mappings
M.mappings = require "custom.mappings"
return M

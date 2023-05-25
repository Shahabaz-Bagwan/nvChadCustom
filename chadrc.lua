-- First read our docs (completely) then check the example_config repo

local M = {}

M.base46 = {
  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = { "notify", "dap" }, -- these aren't compiled by default, ex: "alpha", "notify"
}

M.ui = {
  theme = "chadracula",
  -- hl_override = {
  --   hl_groups = {
  --     CursorLine = {
  --       guibg = "white",
  --     },
  --   },
  -- },
  transparency = true,
  statusline = {
    -- theme = "default", -- default/vscode/vscode_colored/minimal
    -- -- default/round/block/arrow separators work only for default statusline theme
    -- -- round and block will work for minimal theme only
    -- separator_style = "default",
    overriden_modules = function()
      local fn = vim.fn
      local config = require("core.utils").load_config().ui.statusline
      local sep_style = config.separator_style

      local default_sep_icons = {
        default = { left = "", right = " " },
        round = { left = "", right = "" },
        block = { left = "█", right = "█" },
        arrow = { left = "", right = "" },
      }

      local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]
      local sep_l = separators["left"]
      local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

      local current_line = fn.line "."
      local total_line = fn.line "$"
      local text = math.modf((current_line / total_line) * 100) .. tostring "%%"
      text = string.format("%4s", text)

      text = (current_line == 1 and "Top") or text
      text = (current_line == total_line and "Bot") or text

      local line = string.format("%s/%s", current_line, total_line)
      return {
        cursor_position = function()
          return left_sep .. "%#St_pos_text#" .. " " .. line .. " " .. text .. " "
        end,
      }
    end,
  },
}

-- enable custom plugins
M.plugins = "custom.plugins"

-- enable custom mappings
M.mappings = require "custom.mappings"
return M

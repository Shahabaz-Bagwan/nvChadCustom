local cmp = require "cmp"

local options = {
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
  },
}

cmp.setup {
  mapping = options.mapping,
}

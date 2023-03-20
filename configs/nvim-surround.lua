local present, surround = pcall(require, "vim-surround")

if not present then
  return
end

surround.setup({
  keymaps = { -- vim-surround style keymaps
    insert = "<C-g>s",
    normal = "ys",
    visual = "S",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
  aliases = {
    ["a"] = ">", -- Single character aliases apply everywhere
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" }, -- Table aliases only apply for changes/deletions
  },
})

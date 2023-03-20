local M = {}

M.treesitter = {
  ensure_installed = {
    "help",
    "lua",
    "cpp",
    "c",
    "rust",
    "vim",
    "python",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}

M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "clangd",
    "clang-format",
    "rust-analyzer",

  },
}

return M

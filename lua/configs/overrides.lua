local M = {}

M.gitsigns = {
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,    -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,   -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter =
  "<author>, <author_time>, <abbrev_sha> -> <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

M.nvimtree = {
  disable_netrw = false,
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    root_folder_label = false,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions = {},
  extensions_list = { "themes", "terms", "i23" },
}

M.mason = {
  ensure_installed = {
    "luacheck",
    "luaformat",
    "shfmt",
    "rustfmt",
    "cmakelint",
    "grammarly-languageserver",
    "dockerfile-language-server",
    "codelldb",
    "texlab",
    "stylua",
    "xmlformatter",
    "pyright",
    "pylint",
    "lua-language-server",
    "ltex-ls",
    "json-lsp",
    "gitui",
    "fixjson",
    "cpptools",
    "cpplint",
    "cmake-language-server",
    "cmakelang",
    "clang-format",
    "clangd",
    "rust-analyzer",
  },
}

return M

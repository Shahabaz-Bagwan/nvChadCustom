local M = {}

M.cmaketools = {
  cmake_command = "cmake",
  cmake_build_directory = "build",
  cmake_build_directory_prefix = "", -- when cmake_build_directory is "", this option will be activated
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = {"--parallel"},
  cmake_console_size = 10, -- cmake output window height
  cmake_console_position = "belowright", -- "belowright", "aboveleft", ...
  cmake_show_console = "always", -- "always", "only_on_error"
  cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 }
  },
}

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

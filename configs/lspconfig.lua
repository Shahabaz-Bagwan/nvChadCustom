local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
  "lua_ls",
  "grammarly",
  "dockerls",
  "texlab",
  "pyright",
  "ltex",
  "jsonls",
  "cmake",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--suggest-missing-includes",
      "--completion-style=bundled",
      "--cross-file-rename",
      "--header-insertion=iwyu",
    },
    root_dir = {
      root_pattern = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
      },
    },

    filetypes = {
      "c",
      "cpp",
      "objc",
      "objcpp",
      "cuda",
      "proto",
    },
    single_file_support = true,
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
    flags = { debounce_text_changes = 150 },
  },
}

lspconfig.rust_analyzer.setup {
  -- standalone file support
  -- setting it to false may improve startup time
  standalone = true,
  -- options to pass to nvim-lspconfig
  -- i.e. the arguments to require("lspconfig").clangd.setup({})
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    cmd = { "rust-analyzer" },
    ["rust-analyzer"] = {
      cargo = {
        autoReload = true,
      },
    },
    filetypes = { "rust" },
    root_dir = {
      root_pattern = {
        "Cargo.toml",
        "rust-project.json",
      },
    },
  },
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      format = {
        enable = true,
        -- Put format options here
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",
          max_line_length = "unset",
        },
      },
    },
  },
}

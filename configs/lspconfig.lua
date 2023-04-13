local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
  "stylua",
  "grammarly-languageserver",
  "dockerfile-language-server",
  "texlab",
  "pyright",
  "lua-language-server",
  "ltex-ls",
  "json-lsp",
  "cmake-language-server",
  "rust-analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

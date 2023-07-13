local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format.with {
    condition = function(utils)
      return utils.root_has_file { ".clang_format", ".clang-format" }
    end,
  },

  -- b.diagnostics.cpplint,
  b.diagnostics.cspell,

  --cmake
  b.formatting.cmake_format,
  b.diagnostics.cmake_lint,

  --markdown
  b.formatting.markdownlint,
  b.diagnostics.markdownlint,

  --json
  b.formatting.fixjson,
  b.diagnostics.jsonlint,

  --xml
  b.formatting.xmlformat,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

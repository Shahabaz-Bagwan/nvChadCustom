local M = {}

M.general = {
  n = {
    ["<leader>ft"] = { "<cmd> %s/</\r</g <CR> <bar> gg=G", "Format xml" },
    ["<leader>xa"] = { "<cmd> %bd <bar> e# <bar> bd# <bar> '\" <CR>", "Close all buffer but current" },
    ["<leader>sp"] = { "<cmd> set spell! <CR>", "Toggle spell check" },
    ["<leader>pt"] = { "<NOP>" },
    ["<leader>wp"] = { "<cmd> set wrap! <CR>", "Toggle line wrap" },
    ["<leader>ww"] = { "<cmd> write <CR>", "Write/Save file" },
    ["<leader>qq"] = { "<cmd> quitall <CR>", "Session quit" },
    ["gf"] = { "<C-W>vgf", "open file under cursor in vsplit" },
    ["<F3>"] = { "<cmd> set list! <CR>", "Toggle list", opts = { nowait = true } },
    ["<F5>"] = { "<cmd> !python3 % <CR>", "Run python file", opts = { nowait = true } },
    [";"] = { ":", "Enter cmdline", opts = { nowait = true } },
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights", opts = { silent = true } },
    ["<leader>rp"] = { ":%s/<C-r><C-w>//gc<Left><Left><Left>", "Replace word under cursor" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Shift visual selected line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Shift visual selected line up" },
    [";"] = { ":", "Enter cmdline", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd> write <CR>", "Write/Save file" },
    ["<leader>qq"] = { "<cmd> quitall<CR>", "Session quit" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.lspconfig = {
  plugin = true,
  n = {

    ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
    ["gr"] = { "<cmd>Telescope lsp_references<cr>", "References" },
    ["gD"] = { "vim.lsp.buf.declaration", "Goto Declaration" },
    ["<leader>lf"] = { "<NOP>" },
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },
    ["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
    ["<leader>q"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>Q"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
    ["<leader>D"] = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    ["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols ignore_symbols=variable <cr>", "Goto Symbol" },
  },
}

M.lazygit = {
  plugin = true,
  n = {
    ["<leader>lg"] = { "<cmd> LazyGit <CR>", "open lazygit" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fk"] = {
      "<cmd> Telescope keymaps <CR>",
      "show keymaps",
    },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
    ["<leader>gt"] = { "<Nop>" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume old search" },
  },
}

return M

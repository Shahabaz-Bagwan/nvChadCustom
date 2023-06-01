-- custom options
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python3"
vim.o.scrolloff = 8
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.spelllang = "en_us,de_de"
-- vim.opt.foldmethod = "syntax"
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zR" })

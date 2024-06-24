require "nvchad.options"
-- custom options
vim.scriptencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python3"
vim.o.scrolloff = 8
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
vim.o.swapfile = false
vim.o.spelllang = "en_us,de_de"
vim.o.foldmethod = "expr"
vim.o.fixendofline = true
vim.o.endofline = true
vim.o.foldcolumn = "1"
vim.o.relativenumber = true
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zR" })

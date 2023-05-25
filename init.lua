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
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd [[
   augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#41434f
   augroup END

]]

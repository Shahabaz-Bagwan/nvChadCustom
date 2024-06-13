require "nvchad.mappings"

local map = vim.keymap.set
map("n",  "<leader>ft", "<cmd> %s/</\r</g <CR> <bar> gg=G", { desc = "Format xml" }),
map("n",  "<leader>xa", "<cmd> %bd <bar> e# <bar> bd# <bar> '\" <CR>", { desc = "Close all buffer but current" })
map("n",  "<leader>sp", "<cmd> set spell! <CR>", { desc = "Toggle spell check" })
map("n",  "<leader>pt", { desc = "<NOP>" })
map("n",  "<leader>wp", "<cmd> set wrap! <CR>", { desc = "Toggle line wrap" })
map("n",  "gf", "<C-W>vgf", { desc = "open file under cursor in vsplit" })
map("n",  "<F3>", "<cmd> set list! <CR>", { desc = "Toggle list" ,  nowait = true } )
map("n",  "<F5>", "<cmd> !python3 % <CR>", { desc = "Run python file",  nowait = true  })
map({"n", "v"},  ";", ":", { desc = "Enter cmdline",  nowait = true  })
map({"n", "v"},  "<leader>ww", "<cmd> write <CR>", { desc = "Write/Save file" })
map({"n", "v"},  "<leader>qq", "<cmd> quitall <CR>", { desc = "Session quit" })
map("n",  "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights",  silent = true  })
map("n",  "<leader>rp", ":%s/<C-r><C-w>//gc<Left><Left><Left>", { desc = "Replace word under cursor" })
map("v",  "J", ":m '>+1<CR>gv=gv", { desc = "Shift visual selected line down" })
map("v",  "K", ":m '<-2<CR>gv=gv", { desc = "Shift visual selected line up" })

-- debugger
map("n",  "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n",  "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

-- nvimtree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })
map("n", "<C-n>", "<cmd> NvimTreeFocus <CR>", { desc = "focus nvimtree" })

-- cmake tool
map("n", "<leader>cg", "<cmd> CMakeGenerate <CR>", { desc = "Cmake Generate" })
map("n", "<leader>cx", "<cmd> CMakeGenerate! <CR>", { desc = "Clean and generate" })
map("n", "<leader>cb", "<cmd> CMakeBuild <CR>", { desc = "Cmake Build" })
map("n", "<leader>cr", "<cmd> CMakeRun <CR>", { desc = "cmake Run" })
map("n", "<leader>cd", "<cmd> CMakeDebug <CR>", { desc = "cmake Debug" })
map("n", "<leader>cy", "<cmd> CMakeSelectBuildType <CR>", { desc = "Select Build Type" })
map("n", "<leader>ct", "<cmd> CMakeSelectBuildTarget <CR>", { desc = "Select Build Target" })
map("n", "<leader>cl", "<cmd> CMakeSelectLaunchTarget <CR>", { desc = "Select Launch Target" })
map("n", "<leader>coe", "<cmd> CMakeOpenExecutor <CR>", { desc = "Open CMake Executor Console" })
map("n", "<leader>cor", "<cmd> CMakeOpenRunner <CR>", { desc = "Open CMake Runner Console" })
map("n", "<leader>cce", "<cmd> CMakeCloseExecutor <CR>", { desc = "Close CMake Executor Console" })
map("n", "<leader>ccr", "<cmd> CMakeCloseRunner <CR>", { desc = "Close CMake Runner Console" })
map("n", "<leader>ci", "<cmd> CMakeInstall <CR>", { desc = "Intall CMake target" })
map("n", "<leader>cn", "<cmd> CMakeClean <CR>", { desc = "Clean CMake target" })
map("n", "<leader>cse", "<cmd> CMakeStopExecutor <CR>", { desc = "Stop CMake Executor" })
map("n", "<leader>csr", "<cmd> CMakeStopRunner <CR>", { desc = "Stop CMake Runner" })
map("n", "<leader>cp", "<cmd> cd %:p:h <CR> ", { desc = "Change pwd to current file" })

-- LSP
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "gD", "vim.lsp.buf.declaration", { desc = "Goto Declaration" })
map("n", "<leader>lf", { desc = "<NOP>" })
map("n", "<leader>f", function() vim.diagnostic.open_float({ border = "rounded" }) end, { desc = "Floating diagnostic", })
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto Implementation" })
map("n", "<leader>q", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics (Trouble)" })
map("n", "<leader>Q", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
map("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Goto Type Definition" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols ignore_symbols=variable <cr>", { desc = "Goto Symbol" })

-- LazyDocker
map("n", "<leader>ld", "<cmd> LazyDocker <CR>", { desc = "open lazygit" })

-- LazyGit
map("n", "<leader>lg", "<cmd> LazyGit <CR>", "open lazygit" },

-- Telescope
map("n", "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "show keymaps", })
map("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "git commits" })
map("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "git status" })
map("n", "<leader>gt", { desc = "<Nop>" })
map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "Resume old search" })

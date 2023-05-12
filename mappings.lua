local M = {}

M.general = {
  n = {
    ["<leader>ft"] = { "<cmd> %s/</\r</g <CR> <bar> gg=G", "Format xml" },
    ["<leader>sp"] = { "<cmd> set spell! <CR>", "Toggle spell check"},
    ["<leader>wp"] = { "<cmd> set wrap! <CR>", "Toggle line wrap" },
    ["<F3>"] = { "<cmd> set list! <CR>", "Toggle list", opts = { nowait = true } },
    ["<F5>"] = { "<cmd> !python3 % <CR>", "Run python file", opts = { nowait = true } },
    [";"] = { ":", "Enter cmdline", opts = { nowait = true } },
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights", opts = { silent = true } },
  },
  v = {
    [";"] = { ":", "Enter cmdline", opts = { nowait = true } },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.cmaketools = {
  n = {
    ["<leader>cg"] = { "<cmd> CMakeGenerate <CR>", "Cmake Generate" },
    ["<leader>cx"] = { "<cmd> CMakeGenerate! <CR>", "Clean and generate" },
    ["<leader>cb"] = { "<cmd> CMakeBuild <CR>", "Cmake Build" },
    ["<leader>cr"] = { "<cmd> CMakeRun <CR>", "cmake Run" },
    ["<leader>cd"] = { "<cmd> CMakeDebug <CR>", "cmake Debug" },
    ["<leader>cy"] = { "<cmd> CMakeSelectBuildType <CR>", "Select Build Type" },
    ["<leader>ct"] = { "<cmd> CMakeSelectBuildTarget <CR>", "Select Build Target" },
    ["<leader>cl"] = { "<cmd> CMakeSelectLaunchTarget <CR>", "Select Launch Target" },
    ["<leader>co"] = { "<cmd> CMakeOpen <CR>", "Open CMake Console" },
    ["<leader>cc"] = { "<cmd> CMakeClose <CR>", "Close CMake Console" },
    ["<leader>ci"] = { "<cmd> CMakeInstall <CR>", "Intall CMake target" },
    ["<leader>cn"] = { "<cmd> CMakeClean <CR>", "Clean CMake target" },
    ["<leader>cs"] = { "<cmd> CMakeStop <CR>", "Stop CMake Process" },
    ["<leader>cp"] = { "<cmd> cd %:p:h <CR> ", "Change pwd to current file" },
  },
}

M.telescope = {
  n = {
    ["<leader>ff"] = {
      "<cmd> Telescope file_browser path=%:p:h select_buffer=true <CR>",
      "open file browser",
    },
    ["<leader>fk"] = {
      "<cmd> Telescope keymaps <CR>",
      "show keymaps",
    },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
    ["<leader>gt"] = { "<Nop>" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

return M

local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
    ["<Space>"] = { "<Nop>", "", opts = { nowait = true } },
    ["<Esc>"] = { ":noh <CR>", "clear highlights", opts = { silent = true } },
  },
  v = {
    ["<Space>"] = { "<Nop>", "", opts = { nowait = true } },
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
  },
}

M.nvimspectre = {
  n = {
    ["<leader>sr"] = { '<cmd> lua require("spectre").open() <CR>', "Replace in files (Spectre)" },
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
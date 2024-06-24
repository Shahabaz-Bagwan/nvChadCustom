return {
  -- Lazy
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    init = function()
      require("core.utils").load_mappings("lazydocker")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = { "DevcontainerStart", "DevcontainerAttach", "DevcontainerEditNearestConfig" },
    config = function()
      require("devcontainer").setup({})
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    init = function()
      require("core.utils").load_mappings("lazygit")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
      { "<leader>rs",  function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>rls", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "nvim-dap-repl-highlights",
  },
  {
    "rcarriga/cmp-dap",
    config = function()
      require("cmp").setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or
          require("cmp_dap").is_dap_buffer()
        end,
      })

      require("cmp").setup.filetype(
      { "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
      require("custom.configs.dap")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "HUAHUAI23/telescope-dapzzzz",
        lazy = false,
      },
    },
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local opts = require("plugins.configs.cmp")
      local other_opts = require("custom.configs.cmp")

      local merge_tb = vim.tbl_deep_extend
      opts = merge_tb("force", opts, other_opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = { symbol = "│", options = { try_as_border = true } },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "nvim-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  { "tpope/vim-repeat",                event = "VeryLazy" },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, {
          desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference",
          buffer = buffer,
        })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  {
    "kylechui/nvim-surround", -- Surround
    lazy = false,
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "p00f/clangd_extensions.nvim", -- clangd extension, some good stuff
    ft = { "c", "cpp" },
    -- opts = overrides.clangd_extensions,
    -- config = function()
    --   require "custom.configs.clangd_extensions"
    -- end,
  },

  {
    "simrat39/rust-tools.nvim", -- rust, rust, it's rust!
    ft = { "rust" },
    -- opts = overrides.rust_tools,
    -- config = function()
    --   require "custom.configs.rust_tools"
    -- end,
  }, -- better diagnostics list and others

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },   -- override plugin configs

  {
    "williamboman/mason.nvim",
    opts ={
      ensure_installed = {
        "luacheck",
        "luaformat",
        "shfmt",
        "rustfmt",
        "cmakelint",
        "grammarly-languageserver",
        "dockerfile-language-server",
        "codelldb",
        "texlab",
        "stylua",
        "xmlformatter",
        "pyright",
        "pylint",
        "lua-language-server",
        "ltex-ls",
        "json-lsp",
        "gitui",
        "fixjson",
        "cpptools",
        "cpplint",
        "cmake-language-server",
        "cmakelang",
        "clang-format",
        "clangd",
        "rust-analyzer",
      },
   },
  },


  { "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vimdoc",
        "lua",
        "cpp",
        "c",
        "rust",
        "vim",
        "python",
        "markdown",
        "bash",
        "markdown_inline",
        "jsonc",
      },
      indent = {
        enable = true,
        disable = {
          "python",
        },
      },
    },
  },

  { "lewis6991/gitsigns.nvim",         opts = overrides.gitsigns },

  { "nvim-tree/nvim-tree.lua",         lazy = false,               opts = overrides.nvimtree },

  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "Civitasv/cmake-tools.nvim",
    keys = { "<leader>c" },

    init = function()
      require("core.utils").load_mappings("cmaketools")
    end,
    opts = {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_build_directory_prefix = "",                                                -- when cmake_build_directory is "", this option will be activated
      cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_soft_link_compile_commands = false,                                         -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = true,                                           -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
      cmake_build_options = { "--parallel" },
      cmake_console_size = 10,                                                          -- cmake output window height
      cmake_console_position = "belowright",                                            -- "belowright", "aboveleft", ...
      cmake_show_console = "always",                                                    -- "always", "only_on_error"
      cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
      cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 },
      },
    },
  },
}

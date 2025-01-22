local overrides = require("custom.configs.overrides")

local plugins = {
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
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },   -- override plugin configs

  { "williamboman/mason.nvim",         opts = overrides.mason },

  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  { "lewis6991/gitsigns.nvim",         opts = overrides.gitsigns },

  { "nvim-tree/nvim-tree.lua",         lazy = false,               opts = overrides.nvimtree },

  {
    "NvChad/nvterm",
    enabled = false,
  },
}

return plugins

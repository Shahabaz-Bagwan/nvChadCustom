local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
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
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				lazy = false,
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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

	{ "tpope/vim-repeat", event = "VeryLazy" },

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
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},

	{
		"ggandor/flit.nvim",
		keys = function()
			---@type LazyKeys[]
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nx" },
	}, -- Override plugin definition options

	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		config = function()
			require("scrollbar").setup({
				throttle_ms = 1,
				excluded_buftypes = {
					"terminal",
				},
				excluded_filetypes = {
					"nvimtree",
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
				},
				marks = {
					GitAdd = {
						text = "┆",
						priority = 7,
						gui = nil,
						color = "#00ff11",
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "GitSignsAdd",
					},
					GitDelete = {
						text = "▁",
						priority = 7,
						gui = nil,
						color = "#ff0000",
						cterm = nil,
						color_nr = nil, -- cterm
						highlight = "GitSignsDelete",
					},
				},
				handlers = {
					cursor = true,
					diagnostic = true,
					gitsigns = true, -- Requires gitsigns
					handle = true,
					search = false, -- Requires hlslens
					ale = false, -- Requires ALE
				},
			})
		end,
	},

	{
		"dstein64/nvim-scrollview",
		lazy = false,
		config = function()
			require("scrollview").setup({
				excluded_filetypes = { "nvimtree", "terminal" },
				current_only = true,
				winblend = 75,
				signs_on_startup = { "all" },
				diagnostics_severities = { vim.diagnostic.severity.ERROR },
			})
		end,
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
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	}, -- override plugin configs

	{ "williamboman/mason.nvim", opts = overrides.mason },

	{ "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

	{ "lewis6991/gitsigns.nvim", opts = overrides.gitsigns },

	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

	{
		"Civitasv/cmake-tools.nvim",
		keys = { "<leader>c" },

		init = function()
			require("core.utils").load_mappings("cmaketools")
		end,
		opts = overrides.cmaketools,
	},
}

return plugins

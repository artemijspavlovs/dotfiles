return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },

		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},

		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},

		ensure_installed = {
			--
			"graphql",

			--
			"lua",
			"luadoc",

			--
			"python",

			--
			"query",
			"regex",
			"diff",
			"vim",
			"vimdoc",

			-- devops
			"bash",
			"yaml",
			"json",
			"toml",
			"xml",
			"jq",
			"ini",
			"passwd",
			"terraform",
			"hcl",

			-- rust
			"rust",
			"ron",

			-- markdown
			"markdown",
			"markdown_inline",

			-- go
			"go",
			"gomod",
			"gosum",
			"gowork",

			-- web
			"html",
			"javascript",
			"typescript",
			"tsx",
			"jsdoc",
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
				},
			},
			move = {
				enable = true,
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
				goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			},
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,
	},

	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup(opts)
	end,
}


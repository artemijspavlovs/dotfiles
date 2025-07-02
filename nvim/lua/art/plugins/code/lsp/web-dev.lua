return {
	-- TypeScript Tools
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			settings = {
				file_preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
				workspace_preferences = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},

	-- TypeScript extended features
	{
		"jose-elias-alvarez/typescript.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("typescript").setup({
				disable_commands = false,
				debug = false,
				go_to_source_definition = {
					fallback = true,
				},
			})
		end,
	},

	-- Tailwind CSS support
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = true,
	},

	-- React snippets and tools
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				enable = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
				},
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
				},
			})
		end,
	},

	-- Prettier formatting
	{
		"MunifTanjim/prettier.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("prettier").setup({
				bin = "prettier",
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
				cli_options = {
					arrow_parens = "avoid",
					bracket_spacing = true,
					bracket_same_line = false,
					html_whitespace_sensitivity = "css",
					jsx_bracket_same_line = false,
					jsx_single_quote = false,
					print_width = 120,
					prose_wrap = "preserve",
					quote_props = "as-needed",
					semi = true,
					single_quote = false,
					tab_width = 2,
					trailing_comma = "es5",
					use_tabs = false,
				},
			})
		end,
	},

	-- Emmet support for HTML/CSS
	{
		"mattn/emmet-vim",
		ft = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		config = function()
			vim.g.user_emmet_leader_key = "<C-y>"
			vim.g.user_emmet_settings = {
				javascript = {
					extends = "jsx",
				},
				typescript = {
					extends = "tsx",
				},
			}
		end,
	},

	-- CSS color highlighting
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "background",
				enable_named_colors = true,
				enable_tailwind = true,
			})
		end,
	},
}

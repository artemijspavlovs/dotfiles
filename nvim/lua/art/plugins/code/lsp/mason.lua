return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason_tool_installer.setup({
				ensure_installed = {
					"gopls",
					"delve",
				},
			})

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					-- etc
					"awk_ls",
					"ansiblels",
					"autotools_ls",
					"azure_pipelines_ls",
					"bicep",
					"bashls",
					"lemminx", -- xml
					"yamlls",
					"taplo", -- TOML
					"dockerls",
					"docker_compose_language_service",
					"jqls",
					"grammarly",
					"jinja_lsp",
					"helm_ls",
					"lua_ls",
					"terraformls",
					"tflint",

					-- go
					"golangci_lint_ls",
					"gopls",

					-- backend
					"graphql",
					"htmx",
					"biome", -- rust toolchain for js
					-- "tsserver",
					"marksman", -- for markdown, might change
					"spectral", -- openapi
					"rust_analyzer",
					"sqlls",

					-- web
					"cssls",
					"cssmodules_ls",
					"somesass_ls",
					"tailwindcss",
					"eslint",
					"html",

					-- misc
					"pyright",
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
			},
		},
	},
}

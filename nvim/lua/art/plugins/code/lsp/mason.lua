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

			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			-- Check if cmp_nvim_lsp is available
			local capabilities = {}
			local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_nvim_lsp.default_capabilities()
			end

			-- Setup Mason
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
					width = 0.8,
					height = 0.8,
				},
				max_concurrent_installers = 4,
			})

			-- Setup Mason Tool Installer with only valid packages
			mason_tool_installer.setup({
				ensure_installed = {
					-- Go tools
					"gopls",
					"delve",
					"goimports",
					"gofumpt",
					"golines",
					"staticcheck",
					"golangci-lint",

					-- Rust tools
					"rust-analyzer",

					-- Python tools
					"black",
					"isort",
					"flake8",
					"mypy",
					"pylsp",

					-- Other tools
					"stylua",
					"shellcheck",
					"shfmt",
					"yamlfmt",
					"taplo",
				},
				auto_update = true,
				run_on_start = true,
			})

			-- Setup Mason LSP Config with only valid server names
			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					-- etc
					"ansiblels",
					"autotools_ls",
					"azure_pipelines_ls",
					"bicep",
					"lemminx", -- xml
					"yamlls",
					"taplo", -- TOML
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
					"marksman", -- for markdown, might change
					"rust_analyzer",
					"sqlls",

					-- python
					"pylsp",
				},
			})

			-- Setup handlers with proper error checking
			local ok, handlers = pcall(function()
				return mason_lspconfig.setup_handlers
			end)

			if ok and handlers then
				handlers({
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						lspconfig["lua_ls"].setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
									completion = {
										callSnippet = "Replace",
									},
									workspace = {
										checkThirdParty = false,
									},
								},
							},
						})
					end,
					["pylsp"] = function()
						lspconfig["pylsp"].setup({
							capabilities = capabilities,
							settings = {
								pylsp = {
									plugins = {
										black = { enabled = true },
										isort = { enabled = true },
										flake8 = { enabled = true },
										mypy = { enabled = true },
									},
								},
							},
						})
					end,
				})
			end
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
				"debugpy",
			},
		},
	},
}

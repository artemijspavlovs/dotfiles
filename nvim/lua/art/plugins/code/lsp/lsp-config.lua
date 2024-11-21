return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function()
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "show definition, references" })
				keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "show lsp definitions" })
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "show lsp implementations" })
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "show lsp type definitions" })

				keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "code" })
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "see available code actions" })

				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "smart rename" })

				-- diagnostics
				keymap.set(
					"n",
					"<leader>gf",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "show diagnostics for file" }
				)
				keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "show diagnostics for line" })
				vim.keymap.set(
					"n",
					"<leader>gw",
					":lua vim.diagnostic.open_float(nil, { focus = false})<CR>",
					{ desc = "open diagnostics float" }
				)
				vim.keymap.set(
					"n",
					"<leader>gj",
					":lua vim.diagnostic.goto_next()",
					{ desc = "open diagnostics float" }
				)
				vim.keymap.set(
					"n",
					"<leader>gk",
					":lua vim.diagnostic.goto_prev()",
					{ desc = "open diagnostics float" }
				)

				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "jump to previous diagnostic in buffer" })
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "jump to next diagnostic in buffer" })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show documentation for what is under cursor" })

				keymap.set("n", "<leader>l", "", { desc = "lsp" })
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "mapping to restart lsp if necessary" })
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
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
						},
					},
				})
			end,
			["graphql"] = function()
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["biome"] = function()
				lspconfig["biome"].setup({
					capabilities = capabilities,
					root_dir = util.root_pattern("biome.json", "biome.jsonc"),
					single_file_support = false,
					cmd = { "biome", "lsp-proxy" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"typescript",
						"typescript.tsx",
						"typescriptreact",
						"astro",
						"svelte",
						"vue",
						"css",
					},
				})
			end,
		})
	end,
}

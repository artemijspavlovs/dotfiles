return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local keymap = vim.keymap

		-- Set up LspAttach autocmd for keybindings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				local buf = args.buf
				local opts = { buffer = buf, noremap = true, silent = true }

				-- Set keybindings with error handling
				local function set_keymap(mode, lhs, rhs, options)
					local success, err = pcall(vim.keymap.set, mode, lhs, rhs, options)
					if not success then
						vim.notify(
							"Failed to set keymap: " .. mode .. " " .. lhs .. " Error: " .. err,
							vim.log.levels.ERROR
						)
					end
				end

				set_keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				set_keymap("n", "gD", vim.lsp.buf.declaration, opts)
				set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				set_keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				set_keymap({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, opts)
				set_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- diagnostics
				set_keymap("n", "<leader>gf", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				set_keymap("n", "<leader>gl", vim.diagnostic.open_float, opts)
				set_keymap("n", "<leader>gw", ":lua vim.diagnostic.open_float(nil, { focus = false})<CR>", opts)
				set_keymap("n", "<leader>gj", ":lua vim.diagnostic.goto_next()", opts)
				set_keymap("n", "<leader>gk", ":lua vim.diagnostic.goto_prev()", opts)

				-- Use bracket navigation for diagnostics (standard convention)
				set_keymap("n", "[d", vim.diagnostic.goto_prev, opts)
				set_keymap("n", "]d", vim.diagnostic.goto_next, opts)
				set_keymap("n", "K", vim.lsp.buf.hover, opts)

				set_keymap("n", "<leader>l", "", opts)
				set_keymap("n", "<leader>lr", ":LspRestart<CR>", opts)

				-- web dev
				set_keymap("n", "<leader>wto", "<cmd>TypescriptOrganizeImports<cr>", opts)
				set_keymap("n", "<leader>wtR", "<cmd>TypescriptRenameFile<cr>", opts)
				set_keymap("n", "<leader>wti", "<cmd>TypescriptAddMissingImports<cr>", opts)
				set_keymap("n", "<leader>wtu", "<cmd>TypescriptRemoveUnused<cr>", opts)
				set_keymap("n", "<leader>wtf", "<cmd>TypescriptFixAll<cr>", opts)

				-- React specific commands
				set_keymap("n", "<leader>wrr", "<cmd>TSToolsRemoveUnusedImports<cr>", opts)
				set_keymap("n", "<leader>wra", "<cmd>TSToolsAddMissingImports<cr>", opts)
				set_keymap("n", "<leader>wrf", "<cmd>TSToolsFixAll<cr>", opts)

				-- Rust-specific keybindings
				if client and client.name == "rust_analyzer" then
					local rt = require("rust-tools")
					set_keymap("n", "K", rt.hover_actions.hover_actions, opts)
					set_keymap("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
				end

				-- TypeScript-specific settings
				if client and client.name == "typescript-tools" then
					-- Enable typescript formatting in favor of prettier
					client.server_capabilities.documentFormattingProvider = true
				end
			end,
		})

		-- Set up some global keybindings that don't require LSP
		keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "show diagnostics for line" })
		keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { desc = "next diagnostic" })
		keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
		keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "jump to previous diagnostic in buffer" })
		keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "jump to next diagnostic in buffer" })

		-- Debug command to check LSP status
		vim.api.nvim_create_user_command("LspStatus", function()
			local buf = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_active_clients({ bufnr = buf })
			print("Active LSP clients for current buffer:", #clients)
			for _, client in ipairs(clients) do
				print("  -", client.name)
			end

			-- Check if LspAttach autocmd exists
			local autocmds = vim.api.nvim_get_autocmds({ event = "LspAttach" })
			print("LspAttach autocmds:", #autocmds)
			for _, autocmd in ipairs(autocmds) do
				print("  - Group:", autocmd.group_name)
			end
		end, {})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure diagnostic display
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}

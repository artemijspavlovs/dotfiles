return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "rust" },
	config = function()
		local rt = require("rust-tools")

		rt.setup({
			server = {
				settings = {
					-- rust-analyzer settings
					["rust-analyzer"] = {
						-- enable clippy on save
						checkOnSave = {
							command = "clippy",
							extraArgs = { "--", "-W", "clippy::all" },
						},
						-- inlay hints
						inlayHints = {
							lifetimeElisionHints = {
								enable = true,
								useParameterNames = true,
							},
							chainingHints = {
								enable = true,
							},
							closingBraceHints = {
								enable = true,
							},
							typeHints = {
								enable = true,
							},
							parameterHints = {
								enable = true,
							},
						},
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							runBuildScripts = true,
						},
						procMacro = {
							enable = true,
						},
						lens = {
							enable = true,
						},
						hover = {
							actions = {
								enable = true,
								references = {
									enable = true,
								},
							},
						},
					},
				},
			},
			tools = {
				-- automatically set inlay hints
				inlay_hints = {
					auto = true,
					show_parameter_hints = true,
					parameter_hints_prefix = "<- ",
					other_hints_prefix = "=> ",
					highlight = "Comment",
				},
				hover_actions = {
					auto_focus = true,
				},
				on_initialized = function()
					vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
						pattern = { "*.rs" },
						callback = function()
							local _, _ = pcall(vim.lsp.codelens.refresh)
						end,
					})
				end,
			},
		})
	end,
	keys = {
		{ "<leader>R", "", desc = "Rust Tools" },
		{ "<leader>Rr", ":RustRunnables<CR>", desc = "runnables" },
		{ "<leader>Rd", ":RustDebuggables<CR>", desc = "debuggables" },
		{ "<leader>Rc", ":RustOpenCargo<CR>", desc = "open cargo.toml" },
		{ "<leader>Rp", ":RustParentModule<CR>", desc = "parent module" },
		{ "<leader>Re", ":RustExpandMacro<CR>", desc = "expand macro" },
		{ "<leader>Rm", ":RustMoveItemUp<CR>", desc = "move item up" },
		{ "<leader>Rn", ":RustMoveItemDown<CR>", desc = "move item down" },
		{ "<leader>Rs", ":RustStartStandaloneServerForBuffer<CR>", desc = "start server for buffer" },
		{ "<leader>Rh", ":RustHoverActions<CR>", desc = "hover actions" },
		{ "<leader>Rj", ":RustJoinLines<CR>", desc = "join lines" },
		{ "<leader>Rt", "", desc = "tests" },
		{ "<leader>Rtt", ":RustTest<CR>", desc = "test current function" },
		{ "<leader>Rtm", ":RustTest!<CR>", desc = "test module" },
		{ "<leader>Rtf", ":RustTestFile<CR>", desc = "test file" },
		{ "<leader>Rta", ":RustTestAll<CR>", desc = "test all" },
	},
}

return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			lsp_codelens = true, -- Enable code lens for better Go experience
			lsp_inlay_hints = {
				enable = true,
			},
			-- Configure LSP settings
			lsp_cfg = {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
						usePlaceholders = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			},
			-- Configure test settings
			test_efm = true,
			test_runner = "go", -- richgo, go test, richgo, dlv, ginkgo
			run_in_floaterm = true,
			-- Configure debug settings
			dap_debug = true,
			dap_debug_gui = true,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	keys = {
		{ "<leader>G", "", desc = "Go Language Shortcuts" },

		{ "<leader>Gd", "<Cmd>GoDoc<CR>", desc = "add godoc comment" },
		{ "<leader>Gdc", "<Cmd>GoCmt<CR>", desc = "add comment" },

		{ "<leader>Gm", "", desc = "'go mod' stuff" },
		{ "<leader>Gmt", "<Cmd>GoModTidy<CR>", desc = "run 'go mod tidy'" },
		{ "<leader>Gmi", "<Cmd>GoModInit<CR>", desc = "init go mod" },

		{ "<leader>Gc", "<Cmd>GoCodeAction<CR>", desc = "code actions via Go plugin" },

		{ "<leader>Gr", "<Cmd>GoGenReturn<CR>", desc = "generate return value" },

		{ "<leader>Gj", "<Cmd>GoJson2Struct<CR>", desc = "json to go struct" },
		{ "<leader>Gi", "<Cmd>GoImports<CR>", desc = "import the missing packages" },
		{ "<leader>Gif", "<Cmd>GoImport<CR>", desc = "add import" },

		-- Testing
		{ "<leader>Gt", "", desc = "go test stuff" },
		{ "<leader>Gtt", "<Cmd>GoTest<CR>", desc = "test current function" },
		{ "<leader>Gtf", "<Cmd>GoTestFunc<CR>", desc = "test function" },
		{ "<leader>Gta", "<Cmd>GoAlt<CR>", desc = "alternate file" },

		-- tags
		{ "<leader>Gt", "", desc = "go struct tag stuff" },
		{ "<leader>Gta", "", desc = "add tag to struct" },
		{ "<leader>Gtr", "", desc = "remove tag from struct" },
		{ "<leader>Gtaj", "<Cmd>GoAddTag json<CR>", desc = "add json tag to go struct" },
		{ "<leader>Gtrj", "<Cmd>GoRmTag json<CR>", desc = "remove json tag from go struct" },
		{ "<leader>Gtat", "<Cmd>GoAddTag toml<CR>", desc = "add toml tag to go struct" },
		{ "<leader>Gtrt", "<Cmd>GoRmTag toml<CR>", desc = "remove toml tag from go struct" },
		{ "<leader>Gtay", "<Cmd>GoAddTag yaml<CR>", desc = "add yaml tag to go struct" },
		{ "<leader>Gtry", "<Cmd>GoRmTag yaml<CR>", desc = "remove yaml tag from go struct" },
	},
}

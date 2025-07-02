return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- plugins = {
		-- 	marks = true,
		-- 	registers = true,
		-- 	spelling = {
		-- 		enabled = true,
		-- 		suggestions = 20,
		-- 	},
		-- },
		-- operators = { gc = "Comments" },
		-- key_labels = {
		-- 	["<space>"] = "SPC",
		-- 	["<cr>"] = "RET",
		-- 	["<tab>"] = "TAB",
		-- },
		-- window = {
		-- 	border = "rounded",
		-- 	padding = { 1, 3, 1, 3 },
		-- },
		-- layout = {
		-- 	height = { min = 4, max = 25 },
		-- 	width = { min = 20, max = 50 },
		-- 	spacing = 3,
		-- 	align = "left",
		-- },
		-- ignore_missing = true,
		-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
		-- show_help = true,
		-- triggers = "auto",
		-- triggers_blacklist = {
		-- 	i = { "j", "k" },
		-- 	v = { "j", "k" },
		-- },
	},
	-- config = function(_, opts)
	-- 	local wk = require("which-key")
	-- 	wk.setup(opts)
		
	-- 	-- Register key groups
	-- 	wk.register({
	-- 		["<leader>"] = {
	-- 			c = { name = "Code" },
	-- 			g = { name = "Git" },
	-- 			l = { name = "LSP" },
	-- 			w = { name = "Web Dev" },
	-- 		},
	-- 	})
	-- end,
}



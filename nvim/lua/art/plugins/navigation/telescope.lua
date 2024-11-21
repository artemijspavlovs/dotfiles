local telescope_file_browser_opts = {
	extensions = {
		file_browser = {
			theme = "ivy",
			depth = 5,
			auto_depth = false,
			hidden = { file_browser = true, folder_browser = true },
			hide_parent_dir = false,
			collapse_dirs = false,
			prompt_path = false,
			quiet = false,
			dir_icon = "󰉓 ",
			dir_icon_hl = "Default",
			display_stat = { date = true, size = true, mode = true },
			git_status = true,
		},
	},
}

local telescope_key_bindings = {
	{ "<leader>tf", "<Cmd>:Telescope find_files<CR>", { desc = "Search for files by name" } },
	{ "<leader>ts", "<Cmd>:Telescope live_grep<CR>", { desc = "Search for strings in current working directory" } },
	{ "<leader>tr", "<Cmd>:Telescope oldfiles<CR>", { desc = "Search for recent files" } },
	{ "<leader>tt", "<Cmd>:TodoTelescope<CR>", { desc = "Find todos" } },
	{
		"<leader>tc",
		"<Cmd>lua require'telescope.builtin'.live_grep({ search_dirs = { vim.fn.expand('%:p:h') } })<CR>",
		{ desc = "search for strings in current file directory" },
	},

	{
		"<leader>oe",
		":Telescope file_browser<CR>",
		{ noremap = true, desc = "open telescope file browser in current location" },
	},
	{ "<leader>or", ":Telescope file_browser<CR>", { noremap = true, desc = "open telescope file browser in root" } }, --
	{
		"<leader>oc",
		":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		{ noremap = true, desc = "open telescope file browser in current directory" },
	}, --

	-- from https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/plugins/editor.lua#L81
	{
		"<leader>tp",
		function()
			local builtin = require("telescope.builtin")
			builtin.resume()
		end,
		desc = "Resume the previous telescope picker",
	},
	{
		"<leader>td",
		function()
			local builtin = require("telescope.builtin")
			builtin.diagnostics()
		end,
		desc = "Lists Diagnostics for all open buffers or a specific buffer",
	},
	{
		"<leader>ti",
		function()
			local builtin = require("telescope.builtin")
			builtin.treesitter()
		end,
		desc = "Lists Function names, variables, from Treesitter",
	},
}

local telescope_dependencies = {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				-- Your custom configuration here (if any)
			})
			-- Load the Telescope extension for todo-comments
			require("telescope").load_extension("todo-comments")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		opts = telescope_file_browser_opts,
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					initial_mode = "normal",
					theme = "center",
					sorting_strategy = "ascending",

					layout_config = {
						prompt_position = "top",
						anchor = "center",
						height = 25,
						width = 240,
						-- preview_width = 80,
					},
				},
			})

			telescope.load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	dependencies = telescope_dependencies,
	keys = telescope_key_bindings,
}

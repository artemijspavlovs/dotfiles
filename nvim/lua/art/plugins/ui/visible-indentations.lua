local highlight = {
	"CursorColumn",
	"Whitespace",
}

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		whitespace = {
			highlight = highlight,
			remove_blankline_trail = false,
		},
		indent = {
			char = "",
			tab_char = "│",
		},
		scope = { enabled = true },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
}


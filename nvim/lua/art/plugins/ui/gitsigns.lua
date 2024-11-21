return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 100,
			virt_text_pos = "eol",
		},
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}

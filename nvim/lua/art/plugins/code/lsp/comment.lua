return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring", -- tsx and jsx commenting
	},
	opts = {
		-- add any options here
		mappings = {
			basic = true,
			extra = false,
		},
	},
	lazy = false,

	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			-- for jsx, tsx, html, svelve comments
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}

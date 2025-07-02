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
			extra = true, -- Enable extra mappings
		},
		-- Configure comment styles for different file types
		pre_hook = function(ctx)
			-- Only calculate commentstring for tsx file or when inside a tsx block
			local U = require("Comment.utils")

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.blockwise then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end,
	},
	lazy = false,

	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			-- for jsx, tsx, html, svelte comments
			pre_hook = ts_context_commentstring.create_pre_hook(),
			-- Add padding to comments
			padding = true,
			-- Ignore empty lines
			ignore = "^$",
		})

		-- Configure context commentstring for better JSX/TSX support
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}

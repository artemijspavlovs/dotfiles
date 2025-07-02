return {
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		config = true,

		-- ys - add surrounding
		-- ds - delete surrounding
		-- cs - change surrounding
		-- also works with html tags
	},
}

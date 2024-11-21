local function lualine_init()
	vim.g.lualine_laststatus = vim.o.laststatus
	if vim.fn.argc(-1) > 0 then
		-- set an empty statusline till lualine loads
		vim.o.statusline = "Loading Statusline"
	end
end

local function lualine_opts()
	vim.o.laststatus = vim.g.lualine_laststatus

	return {
		options = {
			theme = "nord",
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
		},

		sections = {
			-- lualine_a = { "mode" },
			lualine_a = {},
			lualine_b = { { "branch" }, { "diagnostics" } },
			lualine_c = { "diff" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},

		tabline = {
			lualine_a = { "fileformat" },
			lualine_b = { "encoding", "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		winbar = {
			lualine_a = {
				{
					"mode",
					icons_anebled = true,
					padding = 3,
				},
			},
			lualine_b = {
				{
					-- https://github.com/nvim-lualine/lualine.nvim#filename-component-options
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[No Name]", -- Text to show for unnamed buffers.
						newfile = "[New]", -- Text to show for newly created file before first write
					},
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { {
				"progress",
			} },
			lualine_z = { {
				"location",
			} },
			inactive_winbar = {},
			extensions = {},
		},

		inactive_winbar = {
			lualine_a = { {
				"mode",
				icons_anebled = true,
				padding = 3,
			} },
			lualine_b = {
				{
					-- https://github.com/nvim-lualine/lualine.nvim#filename-component-options
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[No Name]", -- Text to show for unnamed buffers.
						newfile = "[New]", -- Text to show for newly created file before first write
					},
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { {
				"progress",
			} },
			lualine_z = { {
				"location",
			} },
			inactive_winbar = {},
			extensions = {},
		},

		extensions = { "lazy" },
	}
end

return {
	"nvim-lualine/lualine.nvim",
	--  event = "VeryLazy",
	init = lualine_init,
	opts = lualine_opts,
}

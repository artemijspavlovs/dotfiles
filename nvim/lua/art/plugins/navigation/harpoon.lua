return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()
			require("telescope").load_extension("harpoon")

			vim.keymap.set("n", "<leader>h", "", { desc = "Harpoon" })
			vim.keymap.set(
				"n",
				"<leader>hh",
				':lua require("harpoon.ui").toggle_quick_menu()<CR>',
				{ desc = "Toggle Harpoon Quick Menu" }
			)

			-- Key bindings for harpoon
			vim.keymap.set(
				"n",
				"<leader>ha",
				':lua require("harpoon.mark").add_file()<CR>',
				{ desc = "Add File to Harpoon" }
			)
			vim.keymap.set(
				"n",
				"<leader>hr",
				':lua require("harpoon.mark").rm_file()<CR>',
				{ desc = "Remove File from Harpoon" }
			)

			-- Navigation between marks
			vim.keymap.set(
				"n",
				"<leader>h1",
				':lua require("harpoon.ui").nav_file(1)<CR>',
				{ desc = "Go to File 1 in Harpoon" }
			)
			vim.keymap.set(
				"n",
				"<leader>h2",
				':lua require("harpoon.ui").nav_file(2)<CR>',
				{ desc = "Go to File 2 in Harpoon" }
			)
			vim.keymap.set(
				"n",
				"<leader>h3",
				':lua require("harpoon.ui").nav_file(3)<CR>',
				{ desc = "Go to File 3 in Harpoon" }
			)
			vim.keymap.set(
				"n",
				"<leader>h4",
				':lua require("harpoon.ui").nav_file(4)<CR>',
				{ desc = "Go to File 4 in Harpoon" }
			)

			vim.keymap.set(
				"n",
				"<leader>hn",
				':lua require("harpoon.ui").nav_next()<CR>',
				{ desc = "Go to Next Harpoon Mark" }
			)
			vim.keymap.set(
				"n",
				"<leader>hp",
				':lua require("harpoon.ui").nav_prev()<CR>',
				{ desc = "Go to Previous Harpoon Mark" }
			)

			-- Telescope integration for harpooned marks
			vim.keymap.set("n", "<leader>ht", ":Telescope harpoon marks<CR>", { desc = "Harpoon Marks with Telescope" })
			vim.keymap.set("n", "<leader>th", ":Telescope harpoon marks<CR>", { desc = "Harpoon Marks with Telescope" })
		end,
	},
}

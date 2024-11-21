vim.g.mapleader = " "
vim.keymap.set("n", "Q", "<nop>", { desc = "unbind Q" })

-- navigation
-- there's a remap to use telescope file browser
-- vim.keymap.set("n", "<leader>oe", vim.cmd.Ex) -- open file explorer
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "j", "jzz", { desc = "jump down a line and keep cursor in the middle" })
vim.keymap.set("n", "k", "kzz", { desc = "jump up a line and keep cursor in the middle" })

vim.keymap.set("n", "gg", "ggzz", { desc = "jump to the beginning of the file and keep cursor in the middle" })
vim.keymap.set("n", "G", "Gzz", { desc = "jump to the end of the file and keep cursor in the middle" })
vim.keymap.set("n", "{", "{zz", { desc = "jump code block up and keep cursor in the middle" })
vim.keymap.set("n", "}", "}zz", { desc = "jump code block down and keep cursor in the middle" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump half page up and keep cursor in the middle" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump half page down and keep cursor in the middle" })

vim.keymap.set("n", "n", "nzzzv", { desc = "keep search terms in the middle when looking things up" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep search terms in the middle when looking things up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "append the line below you to the current line with a space in between" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste over text without losing the copy buffer" })

-- system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank into system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank current line into system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- cut current line into system clipboard

vim.keymap.set("n", "<leader>g", "", { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>sd", ":lua show_documentation()<CR>", { desc = "show documentation" })

vim.keymap.set("n", "<leader>r", "", { desc = "replace/rename" })

vim.keymap.set(
	"n",
	"<leader>rc",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace the word that the cursor is on" }
)

vim.keymap.set("n", "<leader>o", "", { desc = "Telescope File Browser" })
vim.keymap.set("n", "<leader>t", "", { desc = "Telescope" })

-- resize splits
vim.keymap.set("n", "¬", "<c-w>5<", { desc = "resize split left" })
vim.keymap.set("n", "˙", "<c-w>5>", { desc = "resize split right" })
vim.keymap.set("n", "˚", "<C-W>5+", { desc = "resize split up" })
vim.keymap.set("n", "∆", "<C-W>5--", { desc = "resize split down" })

-- reload file
-- vim.keymap.set("n", "<leader><leader>x", "<cmd> source %<CR>", { desc = "Execute the current file" })

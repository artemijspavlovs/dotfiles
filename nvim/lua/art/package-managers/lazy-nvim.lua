-- install lazyvim if it's not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ import = "art.plugins.ui" },
	{ import = "art.plugins.navigation" },
	{ import = "art.plugins.code" },
	{ import = "art.plugins.code.lsp" },
	{ import = "art.plugins.extra-configuration" },
}

require("lazy").setup(plugins, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

local formatters_by_ft = {
	lua = { "stylua" },

	go = {
		"gofmt",
		"gofumpt",
		"golines",
		"goimports-reviser",
	},

	rust = {
		"rustfmt",
	},

	-- web
	javascript = { "biome" },
	typescript = { "biome" },
	typescriptreact = { "biome" },
	javascriptreact = { "biome" },
	css = { "stylelint" },

	-- iac, devops, cloud
	terraform = { "terraform_fmt" },
	tf = { "terraform_fmt" },
	hcl = { "terraform_fmt" },
	["terraform-vars"] = { "terraform_fmt" },

	-- etc
	sh = { "shellharden", "shellcheck" },
	yaml = { "yamlfmt" },
	json = { "fixjson" },
	-- json = { "biome" }, // biome didn't work 20241110
	-- xml = { "yq" },
	-- csv = { "yq" },
	toml = { "taplo" },
	markdown = { "mdslw", "cbfmt", "markdownlint-cli2", "markdown-toc" },

	["*"] = {
		"squeeze_blanks",
		"trim_newlines",
		"trim_whitespace",
	},
}

local keys = {
	{
		"<leader>cF",
		function()
			require("conform").format({ formatters = { "injected" } })
		end,
		mode = { "n", "v" },
		desc = "Format Injected Langs",
	},
}

local opts = {
	formatters_by_ft = formatters_by_ft,
	keys = keys,
	notify_on_error = true,
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
}

return {
	"stevearc/conform.nvim",
	opts = opts,
}

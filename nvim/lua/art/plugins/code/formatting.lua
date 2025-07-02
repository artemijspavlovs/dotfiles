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
	javascript = { "eslint" },
	typescript = { "eslint" },
	javascriptreact = { "eslint" },
	typescriptreact = { "eslint" },
	css = { "stylelint" },
	scss = { "stylelint", "prettier" },
	html = { "prettier" },
	json = { "prettier", "fixjson" },
	jsonc = { "prettier" },

	-- iac, devops, cloud
	terraform = { "terraform_fmt" },
	tf = { "terraform_fmt" },
	hcl = { "terraform_fmt" },
	["terraform-vars"] = { "terraform_fmt" },

	-- etc
	sh = { "shellharden", "shellcheck" },
	yaml = { "yamlfmt" },
	-- json = { "biome" }, // biome didn't work 20241110
	-- xml = { "yq" },
	-- csv = { "yq" },
	toml = { "taplo" },
	markdown = { "mdslw", "cbfmt", "markdownlint-cli2", "markdown-toc" },
	python = { "black", "isort" },
	sql = { "sqlformat" },

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
	{
		"<leader>cf",
		function()
			require("conform").format({ async = true, lsp_fallback = true })
		end,
		mode = { "n", "v" },
		desc = "Format Buffer",
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
	-- Configure formatters
	formatters = {
		prettier = {
			prepend_args = { "--print-width", "120", "--tab-width", "2", "--use-tabs", "false" },
		},
		black = {
			prepend_args = { "--line-length", "88" },
		},
		isort = {
			prepend_args = { "--profile", "black" },
		},
	},
}

return {
	"stevearc/conform.nvim",
	opts = opts,
}

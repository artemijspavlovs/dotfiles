return {
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",

		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
			},
			"saadparwaiz1/cmp_luasnip",
		},

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local defaults = require("cmp.config.default")()

			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

			require("luasnip.loaders.from_vscode").lazy_load()

			-- Custom sorting function
			local function compare(entry1, entry2)
				local kind_weights = {
					Text = 1,
					Method = 2,
					Function = 3,
					Constructor = 4,
					Field = 5,
					Variable = 6,
					Class = 7,
					Interface = 8,
					Module = 9,
					Property = 10,
					Unit = 11,
					Value = 12,
					Enum = 13,
					Keyword = 14,
					Snippet = 15,
					Color = 16,
					File = 17,
					Reference = 18,
					Folder = 19,
					EnumMember = 20,
					Constant = 21,
					Struct = 22,
					Event = 23,
					Operator = 24,
					TypeParameter = 25,
				}

				local kind1 = kind_weights[entry1:get_kind()] or 0
				local kind2 = kind_weights[entry2:get_kind()] or 0

				if kind1 ~= kind2 then
					return kind1 < kind2
				end

				return entry1:get_word() < entry2:get_word()
			end

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},

				formatting = {
					expandable_indicator = true,
					format = function(entry, vim_item)
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							path = "[Path]",
							nvim_lsp_signature_help = "[Signature]",
						})[entry.source.name]
						return vim_item
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-h>"] = cmp.mapping.scroll_docs(-4),
					["<C-l>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Esc>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				}),

				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "buffer" },
					{ name = "path" },
				}),

				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},

				sorting = {
					comparators = {
						compare,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})

			-- Command line completion
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}

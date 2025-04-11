return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "friendly-snippets", "L3MON4D3/LuaSnip" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "none",

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-space>"] = { "show", "hide" },
			["<C-e>"] = { "cancel", "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		-- trigger = {
		-- 	completion = {
		-- 		show_in_snippet = false,
		-- 	},
		-- },

		appearance = {
			nerd_font_variant = "normal",
			kind_icons = {
				Text = "",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "",
				Interface = "",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "",
				Constant = "󰏿",

				Snippet = "",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = "single" } },
			menu = {
				auto_show = true,
				draw = {
					columns = {
						{ "kind_icon", "label" },
						{ "kind", "source_name", gap = 1 },
					},
				},
			},
		},

		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
			providers = {
				snippets = {
					name = "SNIP",
					min_keyword_length = 2,
				},
				buffer = {
					name = "BUF",
				},
			},
		},

		snippets = { preset = "luasnip" },

		signature = {
			enabled = true,
			window = {
				show_documentation = false,
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}

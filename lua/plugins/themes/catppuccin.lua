return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 10000,
	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "macchiato",
		},
		styles = {
			comments = { "italic" },
			keywords = { "italic" },
			functions = { "italic" },
			booleans = { "bold" },
		},
		dim_inactive = {
			enabled = false,
			shade = "light",
			percentage = 0.15,
		},
		color_overrides = {},
		integrations = {
			cmp = true,
			flash = true,
			gitsigns = true,
			illuminate = true,
			indent_blankline = { enabled = false },
			lsp_trouble = true,
			mason = true,
			mini = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			window_picker = true,
			navic = { enabled = true, custom_bg = "lualine" },
			neotest = true,
			noice = true,
			notify = true,
			neotree = true,
			semantic_tokens = true,
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			treesitter = true,
			which_key = true,
		},
		custom_highlights = function()
			local cmpkind = "#63687e"
			return {
				Visual = { bg = "#15375b" },
				WinSeparator = { fg = "#604ff7", style = { "bold" } },
				InclineNormal = { bg = "#604ff7", fg = "#EFEFEF" },
				InclineNormalNC = { bg = "none", fg = "#ABABAB" },
				CmpItemMenu = { bg = "#152637" },
				CmpItemAbbr = { fg = "#EFEFEF" },
				CmpItemAbbrMatch = { bg = "none", fg = "#279FFF", style = { "bold" } },
				CmpItemMenuCursor = { bg = "#1a3045" },
				CmpItemKindFunction = { fg = cmpkind },
				CmpItemKindField = { fg = cmpkind },
				CmpItemKindVariable = { fg = cmpkind },
				CmpItemKindProperty = { fg = cmpkind },
				CmpItemKindText = { fg = cmpkind },
				CmpItemKindModule = { fg = cmpkind },
				CmpItemKindStruct = { fg = cmpkind },
				CmpItemKindEnum = { fg = cmpkind },
				CmpItemKindSnippet = { fg = cmpkind },
				CmpItemKindKeyword = { fg = cmpkind },
				CmpDocumentationNormal = { bg = "#232533" },
				CmpDocumentationBorder = { fg = "#454444", bg = "#232533" },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}

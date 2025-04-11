return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
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
		},
		dim_inactive = { enabled = false },
		color_overrides = {
			mocha = {
				rosewater = "#f5b8ab",
				flamingo = "#f29d9d",
				pink = "#ad6ff7",
				mauve = "#ff8f40",
				red = "#e66767",
				maroon = "#eb788b",
				peach = "#fab770",
				yellow = "#faca64",
				green = "#70cf67",
				teal = "#4cd4bd",
				sky = "#61bdff",
				sapphire = "#4ba8fa",
				blue = "#00bfff",
				lavender = "#00bbcc",
				text = "#c1c9e6",
				subtext1 = "#a3aac2",
				subtext0 = "#8e94ab",
				overlay2 = "#7d8296",
				overlay1 = "#676b80",
				overlay0 = "#464957",
				surface2 = "#3a3d4a",
				surface1 = "#2f313d",
				surface0 = "#1d1e29",
				base = "#0b0b12",
				mantle = "#11111a",
				crust = "#191926",
			},
		},
		highlight_overrides = {
			all = function(colors)
				return {}
			end,
		},
		integrations = {
			flash = true,
			gitsigns = true,
			illuminate = true,
			indent_blankline = { enabled = true },
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
			blink_cmp = true,
		},
		custom_highlights = function(colors)
			return {
				CursorLine = { bg = colors.surface0 },
				WinSeparator = { fg = colors.lavender, style = { "bold" } },
				InclineNormal = { bg = "none", fg = "#ffffff", style = { "italic" } },
				InclineNormalNC = { bg = "none", fg = "#ababab" },
				NeoTreeFloatBorder = { fg = colors.overlay0 },
				WindowHint = { bg = colors.yellow, fg = colors.base },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	opts = {
		hide_root_node = false,
		retain_hidden_root_indent = false,
		default_component_configs = {
			container = {
				enable_character_fade = true,
				width = "100%",
				right_padding = 0,
			},
			indent = {
				indent_size = 2,
				padding = 2,
			},
			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},
			git_status = {
				symbols = {
					added = "●",
					modified = "M",
					untracked = "?",
					unstaged = "",
					staged = "",
					conflict = "x",
				},
			},
			file_size = {
				enabled = false,
			},
			type = {
				enabled = false,
			},
			last_modified = {
				enabled = false,
			},
		},
		window = {
			position = "float",
			popup = {
				size = { height = "35", width = "60" },
				position = "50%",
				border = {
					style = "rounded",
					text = {
						top = " 󰫻󰫲󰫼󰬃󰫶󰫺 ",
					},
					highlight = "Normal:NeoTreeFloatNormal,FloatBorder:NeoTreeFloatBorder",
				},
				win_options = {
					winblend = 0,
					winhighlight = "NormalNC:NeoTreeFloatNormal,FloatBorder:NeoTreeFloatBorder",
				},
			},
			mappings = {
				["<tab>"] = "open",
				["o"] = "open_with_window_picker",
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["w"] = "none",
				["q"] = "close_window",
				["M"] = "move",
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
			},
		},
		filesystem = {
			window = {
				position = "float",
				win_options = {
					winblend = 0,
				},
			},
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				always_show = {
					".formatter.exs",
					".gitignore",
					".zshrc",
					".wezterm.lua",
					".next",
				},
				always_show_by_pattern = {
					".env*",
				},
			},
			hijack_netrw_behavior = "disabled",
			use_libuv_file_watcher = true,
			follow_current_file = {
				enable = false,
			},
		},
		document_symbols = {
			follow_cursor = true,
		},
	},
	keys = {
		{ "<leader>e", ":Neotree toggle <CR>", desc = "Toggle NeoTree" },
		{ "<leader>0", ":Neotree action=focus <CR>", desc = "NeoTree focus" },
	},
}

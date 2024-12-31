return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "plenary.nvim" },
	lazy = true,
	opts = function()
		return {
			defaults = {
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.90,
					},
				},
				preview = {
					hide_on_startup = true,
				},
				results_title = false,
				selection_caret = "・",
				dynamic_preview_title = true,
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<Tab>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
				file_ignore_patterns = {
					"node_modules/",
					"deps/",
					"_build/",
					"^.elixir_ls/",
					"^.git/",
				},
			},
			pickers = {
				buffers = {
					layout_config = {
						width = 0.65,
						height = 0.60,
					},
				},
				find_files = {
					layout_config = {
						width = 0.50,
						height = 0.60,
					},
				},
			},
		}
	end,
	keys = {
		{"<leader> ", ":Telescope find_files<CR>", desc="Telescope find_files"},
		{"<leader>/", ":Telescope live_grep<CR>", desc="Telescope live_grep"},
		{"<leader>sb", ":Telescope buffers<CR>", desc="Telescope buffers"},
		{"<leader>sh", ":Telescope highlights<CR>", desc="Telescope highlights"}
	}
}

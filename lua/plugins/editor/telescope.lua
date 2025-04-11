return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	dependencies = {
		"plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				preview = false,
				results_title = false,
				selection_caret = "  ",
				dynamic_preview_title = true,
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<Tab>"] = layout.toggle_preview,
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
						width = 0.50,
						height = 0.60,
					},
				},
				find_files = {
					preview = true,
				},
				lsp_document_symbols = {
					preview = true,
				},
				git_bcommits = {
					preview = true,
				},
			},
		})

		telescope.load_extension("fzf")
	end,
	keys = {
		{ "<leader> ", ":Telescope find_files<CR>", desc = "Telescope find_files" },
		{ "<leader>/", ":Telescope live_grep<CR>", desc = "Telescope live_grep" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Telescope buffers" },
		{ "<leader>fh", ":Telescope highlights<CR>", desc = "Telescope highlights" },
		{
			"<leader>fs",
			":Telescope lsp_document_symbols<CR>",
			desc = "Telescope lsp document symbols",
		},
		{ "<leader>fx", ":Telescope quickfix<CR>", desc = "Telescope quickfix" },
	},
}

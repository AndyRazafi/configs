return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"html",
			"css",
		},
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic",
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>q", group = "close" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>s", group = "search" },
				{ "<leader>g", group = "git" },
				{ "<leader>gs", group = "surround" },
				{ "<leader>x", group = "quickfix/fix" },
				{
					"<leader>w",
					group = "windows",
					expand = function()
						return require("which-key.extras").expand.win()
					end,
				},
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic",
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>q", group = "close", icon = "󰩈" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>g", group = "git" },
				{ "<leader>x", group = "quickfix/fix" },
				{ "<leader>u", group = "UI" },
				{ "<leader>c", group = "code", icon = " " },
				{
					"<leader>w",
					group = "windows",
					expand = function()
						return require("which-key.extras").expand.win()
					end,
				},
				{ "gs", group = "surround", icon = "󰘦" },
				{ "gsa", icon = { icon = "", color = "green" } },
				{ "gsd", icon = { icon = "", color = "red" } },
				{ "gsc", icon = "" },
				{ "gss", icon = "󰗈" },
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

return {
	"luckasRanarison/tailwind-tools.nvim",
	lazy = true,
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"treesitter",
		"nvim-telescope/telescope.nvim", -- optional
	},
}

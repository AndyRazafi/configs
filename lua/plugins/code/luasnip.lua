return {
	"L3MON4D3/LuaSnip",
	priority = 10,
	event = "InsertEnter",
	version = "v2.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mlaursen/vim-react-snippets",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("vim-react-snippets").lazy_load()
	end,
}

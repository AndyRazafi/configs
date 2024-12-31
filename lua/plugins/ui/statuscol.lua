return {
	"luukvbaal/statuscol.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = { "gitsigns.nvim" },
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			setopt = true,
			relculright = true,
			segments = {
				{
					sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, colwidth = 2, auto = false },
				},
				{ text = { builtin.lnumfunc, " " } },
				{
					sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 2, auto = false },
				},
			},
			ft_ignore = { "neo-tree" },
		}
	end,
	config = function(_, opts)
		require("statuscol").setup(opts)
	end,
}

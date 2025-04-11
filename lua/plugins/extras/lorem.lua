return {
	"derektata/lorem.nvim",
	ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	config = function()
		require("lorem").opts({
			sentenceLength = "medium",
			comma_chance = 0.2,
			max_commas_per_sentence = 2,
		})
	end,
}

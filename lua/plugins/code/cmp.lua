return {
	"nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"nvim-snippets",
	},
	opts = function()
		local cmp = require("cmp")
		return {
			sorting = require("cmp.config.default")().sorting,
			completion = {
				completeopt = "menu,menuone,noinsert" .. (true and "" or ",noselect"),
			},
			preselect = true and cmp.PreselectMode.Item or cmp.PreselectMode.None,
			window = {
				completion = {
					winhighlight = "Normal:CmpItemMenu,FloatBorder:None,CursorLine:Visual,Search:None",
					col_offset = 0,
					side_padding = 1,
					winblend = 0,
				},
				documentation = {
					winhighlight = "Normal:CmpDocumentationNormal,FloatBorder:CmpDocumentationBorder",
					winblend = 0,
					border = "rounded",
				},
			},
			formatting = {
				format = require("lspkind").cmp_format(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "snippets" },
				{ name = "path" },
				{ name = "buffer" },
			},
			experimental = {
				ghost_text = false, -- this feature conflict with copilot.vim's preview.
			},
			mapping = {
				["<up>"] = cmp.mapping.select_prev_item(),
				["<down>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
			},
		}
	end,
}

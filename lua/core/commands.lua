vim.api.nvim_create_augroup("custom_buffer", { clear = true })
vim.api.nvim_create_augroup("custom_vimenter", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "custom_buffer",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = "custom_vimenter",
-- 	pattern = "*",
-- 	callback = function()
-- 		require("neo-tree.command").execute({
-- 			toggle = true,
-- 		})
-- 	end,
-- })

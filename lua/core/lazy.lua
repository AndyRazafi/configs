local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins.themes" },
		{ import = "plugins.ui" },
		{ import = "plugins.lsp" },
		{ import = "plugins.lsp.extras" },
		{ import = "plugins.editor" },
		{ import = "plugins.code" },
		{ import = "plugins.git" },
		{ import = "plugins.linter" },
		{ import = "plugins.lang" },
		{ import = "plugins.term" },
		{ import = "plugins.extras" },
	},
	checker = { enabled = true, notify = false },
	change_detection = {
		enabled = true,
		notify = false,
	},
})

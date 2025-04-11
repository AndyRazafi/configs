return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		scope = {
			jump = {
				["[i"] = {
					min_size = 2,
					bottom = false,
					cursor = false,
					edge = true,
					treesitter = { blocks = { enabled = false } },
					desc = "jump to top edge of scope",
				},
				["]i"] = {
					min_size = 2,
					bottom = true,
					cursor = false,
					edge = true,
					treesitter = { blocks = { enabled = false } },
					desc = "jump to bottom edge of scope",
				},
			},
		},
		statuscolumn = {
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		dashboard = {
			width = 60,
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			pane_gap = 4,
			preset = {
				header = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==,
\   _-'                                                                `-_   /,
 `''                                                                      ``' ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete buffer",
		},
		{
			"<leader>bo",
			function()
				require("snacks").bufdelete.other()
			end,
			desc = "Delete other buffers",
		},
		{
			"<leader>bO",
			function()
				require("snacks").bufdelete.all()
			end,
			desc = "Delete all buffers",
		},
		{
			"<leader>gb",
			function()
				require("snacks").git.blame_line()
			end,
			desc = "Git blame line",
		},
	},
}

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Dracula"
config.colors = {
	cursor_bg = "white",
	cursor_fg = "black",
}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 15
config.line_height = 1

config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true
config.pane_focus_follows_mouse = true

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

return config

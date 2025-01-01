local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Find out how to set the default shell to be msys2
config.default_prog = { "pwsh.exe" }

-- Disable the window bar
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- config.color_scheme = "carbonfox"
config.color_scheme = "Oxocarbon Dark (Gogh)"

-- config.font = wezterm.font("Victor Mono", {
-- 	weight = "Medium",
-- })

config.font = wezterm.font("IBM Plex Mono", {
	weight = "Regular",
})

config.max_fps = 160

config.font_size = 13
-- config.font_size = 18
config.freetype_load_target = "Light"

config.window_padding = {
	top = 2,
	right = 4,
	bottom = 0,
	left = 4,
}

return config

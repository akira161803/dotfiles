local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 90
config.initial_rows = 25
config.font_size = 17
config.color_scheme = "Kanagawa (Gogh)"
--config.color_scheme = 'aikofog (terminal.sexy)'
config.use_ime = true
config.window_background_opacity = 0.85 -- 透過
config.macos_window_background_blur = 20 -- ぼかし
--config.window_decorations = "RESIZE" -- 上のバー消す
config.hide_tab_bar_if_only_one_tab = true -- タブが一つのとき非表示

-- タブバーを透明にする
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

--タブバーを背景色に合わせる
config.window_background_gradient = {
	colors = { "#000000" },
}

config.show_new_tab_button_in_tab_bar = false -- タブバーの+を消す

wezterm.on('gui-startup', function()
    wezterm.mux.spawn_window({
        position = {
            x = 200,
            y = 100,
        },
    })
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

return config

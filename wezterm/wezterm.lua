local wezterm = require("wezterm")
local config = {}

-- Kanagawa カラースキーム
config.color_scheme = "Kanagawa (Gogh)"

-- 背景透過設定
config.window_background_opacity = 0.85  -- 0.0（完全透明）～ 1.0（不透明）

-- macOS でのブラー効果（オプション）
config.macos_window_background_blur = 20  -- ブラーの強さ



return config

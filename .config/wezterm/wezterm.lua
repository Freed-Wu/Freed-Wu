local wezterm = require 'wezterm'
local act = wezterm.action
return {
    font = wezterm.font_with_fallback {
        'JetBrainsMono Nerd Font Mono', -- 
        'WenQuanYi Micro Hei Mono', -- ①
        'Noto Sans Symbols', -- ⓪
        'Noto Sans Symbols2', -- 🗂
        'Asana Math', -- ≣
    },
    window_background_opacity = 0.75,
    hide_tab_bar_if_only_one_tab = true,
    font_size = 16,
    keys = {
        {key = 'Enter', mods = 'ALT', action = 'DisableDefaultAssignment'},
        {key = '-', mods = 'CTRL', action = 'DisableDefaultAssignment'},
        {key = '=', mods = 'CTRL', action = 'DisableDefaultAssignment'},
        {key = '0', mods = 'CTRL', action = 'DisableDefaultAssignment'},
        {key = 'Backspace', mods = 'SHIFT|CTRL', action = act.ToggleFullScreen}
    }
}

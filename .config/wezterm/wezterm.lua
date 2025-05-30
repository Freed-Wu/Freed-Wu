local wezterm = require 'wezterm'
local hostname = wezterm.hostname()
local font_size
if hostname == 'desktop' then    -- 2560x2880
    font_size = 16
elseif hostname == 'laptop' then -- 3120x2080
    font_size = 12
else
    font_size = 12
end
local act = wezterm.action
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    -- luacheck: ignore 211
    ---@diagnostic disable: unused-local
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)
return {
    enable_kitty_keyboard = true,
    font = wezterm.font_with_fallback {
        'JetBrainsMono NFM',       -- 
        'WenQuanYi Zen Hei Mono',  -- ①
        'WenQuanYi Micro Hei Mono' -- ⇡
    },
    window_background_opacity = 0.75,
    hide_tab_bar_if_only_one_tab = true,
    font_size = font_size,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
    keys = {
        -- disable them to avoid pressing `<prefix>, -` in tmux
        -- use `<C-S-->` to replace
        { key = '-',         mods = 'CTRL',           action = act.SendString '\x1f' },
        { key = '/',         mods = 'CTRL',           action = act.SendString '\x1f' },
        { key = '=',         mods = 'CTRL',           action = 'DisableDefaultAssignment' },
        { key = '0',         mods = 'CTRL',           action = 'DisableDefaultAssignment' },
        { key = 'Enter',     mods = 'ALT',            action = 'DisableDefaultAssignment' },
        { key = 'Backspace', mods = 'SHIFT|CTRL',     action = act.ToggleFullScreen },
        { key = 'Enter',     mods = 'SHIFT',          action = act.SendString '\x1b[13;2u' },
        { key = 'Enter',     mods = 'SHIFT|ALT',      action = act.SendString '\x1b[13;3u' },
        { key = 'Enter',     mods = 'CTRL',           action = act.SendString '\x1b[13;5u' },
        { key = 'Enter',     mods = 'SHIFT|CTRL',     action = act.SendString '\x1b[13;6u' },
        { key = 'Enter',     mods = 'ALT|CTRL',       action = act.SendString '\x1b[13;7u' },
        { key = 'Enter',     mods = 'SHIFT|ALT|CTRL', action = act.SendString '\x1b[13;8u' }
    }
}

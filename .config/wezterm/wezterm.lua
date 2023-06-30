local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

return {
  automatically_reload_config = true,

  color_scheme = 'Hardcore',

  -- font
  font = wezterm.font_with_fallback({
    "Hack Nerd Font"
  }),
  font_size = 14,
  line_height = 1.2,
  cell_width = 0.9,

  -- cursor
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 400,

  -- tab bar
  enable_tab_bar = true,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_ime = true,

  window_background_opacity = 0.9,
  term = "xterm-256color",

  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7
  },

  use_dead_keys = false,
  scrollback_lines = 5000,

  -- keys
  keys = {
    { key = 'Enter', mods = 'CMD',       action = act.ActivateCopyMode },
    { key = 'd',     mods = 'CMD',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'd',     mods = 'SHIFT|CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, }
  }
}

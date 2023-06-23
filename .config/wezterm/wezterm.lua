local wezterm = require 'wezterm'

return {
  automatically_reload_config = true,

  -- font
  font = wezterm.font_with_fallback({
    "Hack Nerd Font"
  }),
  font_size = 13,
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
}

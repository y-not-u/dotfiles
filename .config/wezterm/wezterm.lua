local wezterm = require 'wezterm'
local utils = require "utils"
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

wezterm.on('gui-startup', function()
  local _, _, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

local function get_font_size()
  if utils.getOS() == 'Darwin' then
    return 19.0
  else
    return 16.0
  end
end

config = {
  automatically_reload_config = true,

  -- color scheme
  term = "xterm-256color",
  color_scheme = 'tokyonight',

  -- font
  font = wezterm.font_with_fallback({
    "FiraCode Nerd Font",
    "Hack Nerd Font",
  }),
  font_size = get_font_size(),
  line_height = 1.2,
  cell_width = 1.0,

  -- cursor
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 600,

  -- tab bar
  enable_tab_bar = false,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_ime = true,

  -- window
  window_background_opacity = 0.85,
  window_decorations = "RESIZE",
  macos_window_background_blur = 10,
  native_macos_fullscreen_mode = true,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 3,
    right = 3,
    top = 2,
    bottom = 0,
  },
  background = {
    {
      source = {
        File = '~/Pictures/Wallpapers/archlinux.png',
      },
      opacity = 1.0,
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      vertical_align = 'Middle',
      horizontal_align = 'Center',
      hsb = {
        brightness = 0.2
      }
    },
  },
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7
  },

  use_dead_keys = false,
  scrollback_lines = 5000,
  enable_scroll_bar = false,

  -- keys
  keys = {
    { key = 'Enter', mods = 'CMD',       action = act.ActivateCopyMode },
    { key = 'd',     mods = 'CMD',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'd',     mods = 'SHIFT|CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, }
  },

  mouse_bindings = {
    -- Scrolling up while holding CTRL increases the font size
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'CTRL',
      action = act.IncreaseFontSize,
    },

    -- Scrolling down while holding CTRL decreases the font size
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'CTRL',
      action = act.DecreaseFontSize,
    },

    -- Bind 'Up' event of CTRL-Click to open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
    -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.Nop,
    },

    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection 'PrimarySelection',
    },
  },
}

return config

local wezterm = require 'wezterm'
local utils = require "utils"
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
  local _, _, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime '%a %b %-d %H:%M '

  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  window:set_right_status(wezterm.format {
    { Text = bat .. '   ' .. date },
  })
end)

local font_size
if utils.getOS() == 'Darwin' then
  font_size = 22.0
else
  font_size = 16.0
end

return {
  automatically_reload_config = true,

  -- color scheme
  term = "xterm-256color",
  color_scheme = 'tokyonight',

  -- font
  font = wezterm.font_with_fallback({
    "FiraCode Nerd Font",
    "Hack Nerd Font",
  }),
  font_size = font_size,
  line_height = 1.2,
  cell_width = 1.0,

  -- cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 400,

  -- tab bar
  enable_tab_bar = true,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_ime = true,

  -- window
  window_background_opacity = 0.85,
  macos_window_background_blur = 20,
  native_macos_fullscreen_mode = true,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  background = {
    {
      source = {
        File = '/home/egg/Pictures/Wallpapers/archlinux.png',
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

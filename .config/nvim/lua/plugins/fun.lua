return {
  {
    'wthollingsworth/pomodoro.nvim',
    config = true,
    cmd = { "PomodoroStart", "PomodoroStop", "PomodoroStatus" }
  },
  -- a screensaver
  {
    "folke/drop.nvim",
    event = "VeryLazy",
    opts = {
      interval = 300,
    }
  }
}

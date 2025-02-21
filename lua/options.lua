require "nvchad.options"
require("livepreview.config").set {
  port = 5500,
  autokill = false,
  browser = "default",
  dynamic_root = false,
  sync_scroll = true,
  picker = "telescope",
}

-- local notify = require "notify"
-- notify.setup {
--   timeout = 1450,
--   render = "minimal",
--   stages = "fade_in_slide_out",
--   on_open = function(win)
--     vim.api.nvim_win_set_config(win, { focusable = false })
--   end,
-- }

-- add yours here!

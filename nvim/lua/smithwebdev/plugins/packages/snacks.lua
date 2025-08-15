local snacks = require('snacks')
local dashboard = require('smithwebdev.plugins.packages.snacks.dashboard')

snacks.setup({
  bigfile = { enabled = false },
  dashboard = dashboard,
  explorer = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = {
    enabled = false,
    animate = {
      duration = { step = 10, total = 100 },
      easing = "linear",
    },
    animate_repeat = {
      delay = 50,
      duration = { step = 3, total = 20 },
      easing = "linear",
    },
  },
  statuscolumn = { enabled = false },
  words = { enabled = false },
})


-- Animate window height towards a target size
-- local function animate_focus_resize(win, target_height, duration, easing)
--   local animate = require("snacks.animate")
--   local cur_height = vim.api.nvim_win_get_height(win)
--   local delta = target_height - cur_height
--
--   -- Only animate if size change is needed
--   if delta ~= 0 then
--     animate.run({
--       duration = duration or 250, -- in ms
--       easing = easing or "inOutSine", -- smooth in & out
--       step = function(progress)
--         local new_height = math.floor(cur_height + delta * progress)
--         pcall(vim.api.nvim_win_set_height, win, new_height)
--       end,
--     })
--   end
-- end
--
-- -- Optional: shrink unfocused windows for emphasis
-- local function animate_unfocused_resize(win, target_height)
--   local animate = require("snacks.animate")
--   local cur_height = vim.api.nvim_win_get_height(win)
--   local delta = target_height - cur_height
--
--   if delta ~= 0 then
--     animate.run({
--       duration = 200,
--       easing = "outSine",
--       step = function(progress)
--         local new_height = math.floor(cur_height + delta * progress)
--         pcall(vim.api.nvim_win_set_height, win, new_height)
--       end,
--     })
--   end
-- end
--
-- -- Auto-animate pane focus
-- vim.api.nvim_create_autocmd("WinEnter", {
--   callback = function(args)
--     local focused = args.win
--     local wins = vim.api.nvim_tabpage_list_wins(0)
--
--     -- Animate focused window to be larger
--     animate_focus_resize(focused, 25, 250, "inOutSine")
--
--     -- Optionally animate all other windows smaller
--     for _, win in ipairs(wins) do
--       if win ~= focused then
--         animate_unfocused_resize(win, 10)
--       end
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("WinEnter", {
--   callback = function()
--     local snacks = require("snacks")
--     if snacks.scroll then
--       snacks.scroll.scroll_cursor_into_view()
--     end
--   end,
-- })

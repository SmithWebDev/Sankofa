-- local blink = require'blink.cmp'
-- local choice_maps = require('smithwebdev.core.utils.blink_luasnip').luasnip_choice_mappings("<C-l>", "<C-h>")
--
-- blink.setup()
local blink = require("blink.cmp")

-- local function cycle_choice(next_key, prev_key)
--   local ok, ls = pcall(require, "luasnip")
--   if not ok then return {} end
--
--   return {
--     [next_key] = function(cmp)
--       if ls.choice_active() then
--         ls.change_choice(1)
--         return
--       end
--       return cmp.fallback_to_mappings()
--     end,
--     [prev_key] = function(cmp)
--       if ls.choice_active() then
--         ls.change_choice(-1)
--         return
--       end
--       return cmp.fallback_to_mappings()
--     end,
--   }
-- end

blink.setup({
  completion = {
    trigger = {
      show_on_keyword = true,
      show_on_insert = true,
      show_on_trigger_character = true,
    },
  },
  snippets = {
    preset = "luasnip",
  },
  keymap = {
    preset = "default",
  },
  cmdline = {
    keymap = { preset = 'inherit' },
    completion = { menu = { auto_show = true } },
  }
})


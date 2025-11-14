-- local blink = require'blink.cmp'
-- local choice_maps = require('smithwebdev.core.utils.blink_luasnip').luasnip_choice_mappings("<C-l>", "<C-h>")
--
-- blink.setup()
local blink = require("blink.cmp")

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


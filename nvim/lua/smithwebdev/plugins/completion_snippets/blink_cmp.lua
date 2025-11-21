-- local blink = require'blink.cmp'
-- local choice_maps = require('smithwebdev.core.utils.blink_luasnip').luasnip_choice_mappings("<C-l>", "<C-h>")
--
-- blink.setup()
print("Blink config loaded")
local blink = require("blink.cmp")

blink.setup({
  completion = {
    keyword = {
      range = "prefix",
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      auto_show = true,
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      },
    },
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
    ["<C-j>"] ={ 'select_next', 'fallback' },
    ["<C-k>"] ={ 'select_prev', 'fallback' }
  },
  cmdline = {
    keymap = { preset = 'inherit' },
    completion = { menu = { auto_show = true } },
  }
})


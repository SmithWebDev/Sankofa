local blink = require'blink.cmp'
blink.setup({
  keymap = {},
  completion = {
    documentation = {
      auto_show = false,
    }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  }
})

local blink = require("blink.cmp")

blink.setup({
  completion = {
    accept = { auto_brackets = { enabled = true, }, },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
    keyword = { range = "prefix", },
    list = { selection = { preselect = false, auto_insert = true } },
    menu = { auto_show = true,
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          }
        },
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" } }, }, },
    trigger = { show_on_keyword = true, show_on_insert = true, show_on_trigger_character = true, },
  },
  snippets = { preset = "luasnip", },
  sources = {
    default = { 'lsp', 'path','snippets', 'buffer' },
  },
  keymap = {
    preset = "default",
    ["<C-j>"] ={ 'select_next', 'snippet_forward', 'fallback' },
    ["<C-k>"] ={ 'select_prev', 'snippet_backward', 'fallback' },
    ["<c-n>"] = {'scroll_documentation_down', 'scroll_signature_up'},
    ["<c-p>"] = {'scroll_documentation_up', 'scroll_signature_down'},
  },
  cmdline = {
    keymap = { preset = 'inherit' },
    completion = { menu = { auto_show = true } },
  }
})

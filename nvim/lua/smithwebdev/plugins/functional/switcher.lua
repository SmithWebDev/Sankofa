require("switcher-nvim").setup({
  --[[General]]
  traverse_forwards = {
    mode = { "n", "i" },
    lhs = "<C-Tab>",
    opts = { noremap = true, desc = "Traverse Open Buffers from most recently accessed first" },
  },
  traverse_backwards = {
    mode = { "n", "i" },
    lhs = "<C-S-Tab>",
    opts = { noremap = true, desc = "Traverse Open Buffers from least recently accessed first" },
  },
  --[[Selection]]
  selection = {
    timeout_ms = 500,
    icon_margin_left = "", -- or "[", "<<<" ... any string, really :) 
    icon_margin_right  = "", -- or "]", ">>>" ...
    chevron = "", -- or "󰅂" , "󱞩", "-->" ...
  },
  --[[Borders]]
  borders = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- or { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }
})

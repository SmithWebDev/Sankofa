local blink = require'blink.cmp'
local choice_maps = require('smithwebdev.core.utils.blink_luasnip').luasnip_choice_mappings("<C-l>", "<C-h>")
blink.setup({
  completion = {
    trigger = {
      mode = 'auto',
      show_on_insert = true,
      show_on_trigger_character = true,
      -- show_in_snippet = false
    },
    documentation = {
      auto_show = false,
    }
  },
  snippets = {
    preset = 'luasnip'
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  -- blink.cmp keymap table — default preset (from the docs)
  -- https://cmp.saghen.dev/configuration/keymap.html
  keymap = {
    preset = "default",
    mappings = vim.tbl_extend("force", {
      -- ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      -- ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-j>"] = function(cmp)
        if cmp.snippet_active() then return cmp.snippet_forward() end
        return cmp.select_next()
      end,
      ["<C-k>"] = function(cmp)
        if cmp.snippet_active() then return cmp.snippet_backward() end
        return cmp.select_prev()
      end,
    }, choice_maps),

    --   ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    --   ["<C-e>"]     = { "hide", 'fallback' },
    --   ["<CR>"]      = { "accept", "fallback" },
    --
    --   ["<Up>"]      = { "select_prev", "fallback" },
    --   ["<Down>"]    = { "select_next", "fallback" },
    --   ["<C-p>"]     = { "select_prev", "fallback_to_mappings" },
    --   ["<C-n>"]     = { "select_next", "fallback_to_mappings" },
    --   ["<C-k>"]     = { "select_prev", "fallback_to_mappings" },
    --   ["<C-j>"]     = { "select_next", "fallback_to_mappings" },
    --
    --   ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
    --   ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
    --
    --   ["<Tab>"]     = { "snippet_forward", "fallback" },
    --   ["<S-Tab>"]   = { "snippet_backward", "fallback" },
    --
    --   ["<C-s>"]     = { "show_signature", "hide_signature", "fallback" },
    -- }
  }
})

-- Menu + docs
-- vim.keymap.set("i", "<C-Space>", blink.show, { desc = "Blink: show menu" })
-- vim.keymap.set("i", "<C-e>",     blink.hide, { desc = "Blink: hide menu" })
-- vim.keymap.set("i", "<C-y>",     blink.select_and_accept, { desc = "Blink: accept selection" })
-- vim.keymap.set("i", "<C-f>", function() blink.scroll_documentation_down(4) end, { desc = "Blink: docs down" })
-- vim.keymap.set("i", "<C-b>", function() blink.scroll_documentation_up(4) end,  { desc = "Blink: docs up" })
--
-- -- Provider-targeted menu (only LSP + snippets)
-- vim.keymap.set("i", "<C-s>", function()
  --   blink.show({ providers = { "lsp", "snippets" } })
  -- end, { desc = "Blink: show LSP+snippets" })
  --
  -- -- Accept a specific item (e.g., first entry)
  -- vim.keymap.set("i", "<C-Enter>", function()
    --   blink.accept({ index = 1 })
    -- end, { desc = "Blink: accept first item" })
    --
    -- -- Separate snippet jumps (no conflicts)
    -- vim.keymap.set({ "i", "s" }, "<C-j>", blink.snippet_forward,  { desc = "Snippet next" })
    -- vim.keymap.set({ "i", "s" }, "<C-k>", blink.snippet_backward, { desc = "Snippet prev" })

local luasnip_status, ls = pcall(require, 'luasnip')
if not luasnip_status then
  return
end

ls_extras = require("luasnip.extras")
ls_extras_fmt = require("luasnip.extras.fmt")

-- some shorthands...
s = ls.snippet
sn = ls.snippet_node
isn = ls.indent_snippet_node
t = ls.text_node
i = ls.insert_node
f = ls.function_node
c = ls.choice_node
d = ls.dynamic_node
r = ls.restore_node
l = ls_extras.lambda
rep = ls_extras.rep
p = ls_extras.partial
m = ls_extras.match
n = ls_extras.nonempty
dl = ls_extras.dynamic_lambda
fmt = ls_extras_fmt.fmt
fmta = ls_extras_fmt.fmta
types = require("luasnip.util.types")
conds = require("luasnip.extras.expand_conditions")

-- local ls = require "luasnip"
-- local ls_extras = require("luasnip.extras")
-- local ls_extras_fmt = require("luasnip.extras.fmt")
--
-- -- some shorthands...
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = ls_extras.lambda
-- local rep = ls_extras.rep
-- local p = ls_extras.partial
-- local m = ls_extras.match
-- local n = ls_extras.nonempty
-- local dl = ls_extras.dynamic_lambda
-- local fmt = ls_extras_fmt.fmt
-- local fmta = ls_extras_fmt.fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

-- TO.DO: Think about `locally_jumpable`, etc.
-- Might be nice to send PR to luasnip to use filters instead for these functions ;)

vim.snippet.expand = ls.lsp_expand

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.active = function(filter)
  filter = filter or {}
  filter.direction = filter.direction or 1

  if filter.direction == 1 then
    return ls.expand_or_jumpable()
  else
    return ls.jumpable(filter.direction)
  end
end

---@diagnostic disable-next-line: duplicate-set-field
vim.snippet.jump = function(direction)
  if direction == 1 then
    if ls.expandable() then
      return ls.expand_or_jump()
    else
      return ls.jumpable(1) and ls.jump(1)
    end
  else
    return ls.jumpable(-1) and ls.jump(-1)
  end
end

vim.snippet.stop = ls.unlink_current

-- ================================================
--      My Configuration
-- ================================================
ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  override_builtin = true,
}

-- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/smithwebdev/snippets/*.lua", true)) do
--   loadfile(ft_path)()
-- end

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
end, { silent = true })

-- TODO: Inform system which directory/file to find or add filetypes.lua custom snippets. <smithwebdev> 

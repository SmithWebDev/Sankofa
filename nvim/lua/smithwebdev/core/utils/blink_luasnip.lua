local M = {}

---Create Blink keymaps to control LuaSnip choice nodes.
---@param next_key string? default "<C-l>"
---@param prev_key string? default "<C-h>"
---@return table<string, function>
-- function M.luasnip_choice_mappings(next_key, prev_key)
--   next_key = next_key or "<C-l>"
--   prev_key = prev_key or "<C-h>"
--
--   local function change(dir)
--     local ok, ls = pcall(require, "luasnip")
--     if ok and ls.choice_active() then
--       ls.change_choice(dir)
--       return true
--     end
--     return false
--   end
--
--   return {
--     [next_key] = function(cmp)
--       if change(1) then return end
--       return cmp.fallback_to_mappings()
--     end,
--     [prev_key] = function(cmp)
--       if change(-1) then return end
--       return cmp.fallback_to_mappings()
--     end,
--   }
-- end

return M

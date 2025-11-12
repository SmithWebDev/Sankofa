-- Nvim-UFO: dynamic LSP ↔ Treesitter selection, with indent fallback

local function lsp_supports_folding(bufnr)
  -- Neovim 0.8+ keeps caps on `server_capabilities`
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    local caps = client.server_capabilities or {}
    if caps.foldingRangeProvider ~= nil and caps.foldingRangeProvider ~= false then
      return true
    end
    -- (older servers may expose `caps.foldingRange` table)
    if caps.foldingRange ~= nil then
      return true
    end
  end
  return false
end

require("ufo").setup({
  provider_selector = function(bufnr, _filetype, _buftype)
    if lsp_supports_folding(bufnr) then
      return { "lsp", "indent" }
    else
      return { "treesitter", "indent" }
    end
  end,
  -- optional: keep imports/comment regions closed initially
  close_fold_kinds_for_ft = { default = { "imports", "comment" } },
})

-- Recommended keymaps that don’t fight foldlevel
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)

-- Peek folded lines; fall back to LSP hover if no fold under cursor
vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then vim.lsp.buf.hover() end
end)

-- updated options for ufo
--
-- -- lua/plugins/ufo.lua
-- return {
--   "kevinhwang91/nvim-ufo",
--   dependencies = { "kevinhwang91/promise-async" },
--   event = "VeryLazy",
--
--   init = function()
--     -- UFO requires big foldlevel to avoid auto-closing on updates.
--     vim.o.foldcolumn = "1"
--     vim.o.foldlevel = 99
--     vim.o.foldlevelstart = 99
--     vim.o.foldenable = true
--
--     -- Ensure views actually record folds.
--     local vo = vim.opt.viewoptions:get()
--     local has_folds = false
--     for _, v in ipairs(vo) do if v == "folds" then has_folds = true break end end
--     if not has_folds then table.insert(vo, "folds"); vim.opt.viewoptions = vo end
--   end,
--
--   config = function()
--     local function lsp_supports_folding(bufnr)
--       for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
--         local caps = client.server_capabilities or {}
--         if caps.foldingRangeProvider ~= nil and caps.foldingRangeProvider ~= false then
--           return true
--         end
--         if caps.foldingRange ~= nil then
--           return true
--         end
--       end
--       return false
--     end
--
--     require("ufo").setup({
--       provider_selector = function(bufnr, _ft, _bt)
--         if lsp_supports_folding(bufnr) then
--           return { "lsp", "indent" } -- main + fallback only
--         else
--           return { "treesitter", "indent" }
--         end
--       end,
--     })
--
--     -- ---------- Persist/restore folds (views) ----------
--     local group = vim.api.nvim_create_augroup("UfoPersist", { clear = true })
--
--     local function is_persistable(buf)
--       if not vim.api.nvim_buf_is_loaded(buf) then return false end
--       if vim.bo[buf].buftype ~= "" then return false end
--       if vim.bo[buf].filetype == "" then return false end
--       local name = vim.api.nvim_buf_get_name(buf)
--       return name ~= nil and name ~= ""
--     end
--
--     local function save_view()
--       local buf = vim.api.nvim_get_current_buf()
--       if is_persistable(buf) then pcall(vim.cmd, "silent! mkview") end
--     end
--
--     local function load_view_after_ufo()
--       -- Kick UFO to compute folds, then restore view a moment later.
--       pcall(vim.cmd, "silent! UfoEnableFold")
--       vim.defer_fn(function() pcall(vim.cmd, "silent! loadview") end, 50)
--       -- In case providers update again asynchronously, try once more.
--       vim.defer_fn(function() pcall(vim.cmd, "silent! loadview") end, 200)
--     end
--
--     vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--       group = group,
--       callback = function()
--         local buf = vim.api.nvim_get_current_buf()
--         if is_persistable(buf) then load_view_after_ufo() end
--       end,
--     })
--
--     vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost" }, {
--       group = group,
--       callback = save_view,
--     })
--
--     -- ---------- Optional keymaps ----------
--     -- Open/close all folds without clobbering foldlevel
--     vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO: Open all folds" })
--     vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO: Close all folds" })
--
--     -- Peek folded lines; if none under cursor, fall back to LSP hover
--     vim.keymap.set("n", "K", function()
--       local winid = require("ufo").peekFoldedLinesUnderCursor()
--       if not winid then vim.lsp.buf.hover() end
--     end, { desc = "UFO: Peek fold / LSP hover" })
--
--     -- ---------- User commands ----------
--     -- 1) Save/load view on demand
--     vim.api.nvim_create_user_command("UfoPersistSave", function() save_view() end, {})
--     vim.api.nvim_create_user_command("UfoPersistLoad", function() load_view_after_ufo() end, {})
--
--     -- 2) Make this buffer manual: detach UFO, set foldmethod=manual, and persist.
--     vim.api.nvim_create_user_command("UfoMakeManual", function(opts)
--       local win = vim.api.nvim_get_current_win()
--       local buf = vim.api.nvim_get_current_buf()
--       -- Detach UFO for this buffer
--       pcall(vim.cmd, "silent! UfoDetach")
--       -- Switch to true manual folds
--       vim.api.nvim_set_option_value("foldmethod", "manual", { win = win })
--       vim.api.nvim_set_option_value("foldexpr", "0", { win = win })
--       vim.api.nvim_set_option_value("foldenable", true, { win = win })
--       -- Persist current state
--       save_view()
--       if not opts.bang then
--         vim.notify("UFO detached; buffer set to manual folds (zf/zd). View saved.", vim.log.levels.INFO)
--       end
--     end, { bang = true, desc = "Detach UFO and use manual folds for this buffer" })
--   end,
-- }

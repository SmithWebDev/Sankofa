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


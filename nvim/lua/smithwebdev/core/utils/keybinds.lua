-- ============================================================================
-- Improved `gf` keybind for Lua `require` paths
-- - Language-agnostic base
-- - Lua-specific syntax handling
-- - Recursive parent directory creation
-- - Absolute path resolution
-- - Silent skip for plugin paths
-- ============================================================================

local M = {}

-- Detect if path is inside a plugin installation folder
local function is_plugin_path(path)
  return path:match("/site/pack/") or path:match("/lazy/") or
         path:match("/start/") or path:match("/opt/")
end

-- Extract and normalize Lua `require` path under cursor
local function get_lua_require_path()
  local word = vim.fn.expand("<cWORD>")
  local module_name = word:match("[\"']([^\"']+)[\"']")
  if not module_name then return nil end
  return module_name:gsub("%.", "/") .. ".lua"
end

-- Determine project Lua root (assumes cwd is project root)
local function get_project_lua_root()
  -- You could make this smarter with LSP or rooter detection
  return vim.fn.getcwd() .. "/nvim/lua"
end

-- Ensure all parent directories exist (recursive creation)
local function ensure_parent_dirs(filepath)
  local parent = vim.fn.fnamemodify(filepath, ":h")
  if vim.fn.isdirectory(parent) == 0 then
    vim.fn.mkdir(parent, "p") -- "p" ensures recursive mkdir
  end
end

-- Open file if exists, otherwise create + open
local function open_or_create_file(filepath)
  if is_plugin_path(filepath) then
    return -- silent skip for plugin paths
  end
  if vim.fn.filereadable(filepath) == 0 then
    ensure_parent_dirs(filepath)
    vim.fn.writefile({}, filepath) -- create empty file
  end
  vim.cmd.edit(filepath)
  -- Ensure filetype is set
  if vim.bo.filetype == "" then
    vim.bo.filetype = vim.bo[vim.fn.bufnr("#")].filetype or ""
  end
end

-- Main handler for improved gf
function M.go_to_file()
  local filepath
  -- First, try Lua `require` handling
  if vim.bo.filetype == "lua" then
    local lua_path = get_lua_require_path()
    if lua_path then
      filepath = get_project_lua_root() .. "/" .. lua_path
    end
  end
  -- If no Lua require match, fall back to word under cursor
  if not filepath then
    filepath = vim.fn.expand("<cfile>")
    if not vim.fn.fnamemodify(filepath, ":p"):match("^/") then
      filepath = vim.fn.getcwd() .. "/" .. filepath
    end
  end
  -- Resolve to absolute path
  filepath = vim.fn.fnamemodify(filepath, ":p")
  open_or_create_file(filepath)
end

-- Map gf to our improved function
-- vim.keymap.set("n", "gf", M.go_to_file, { noremap = true, silent = true })

return M

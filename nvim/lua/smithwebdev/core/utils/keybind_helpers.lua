--- Creates local table to scope the function
local M = {}

-- Helper to convert a Lua module path (e.g., "my.module") to a filesystem path ("my/module.lua").
local function convert_lua_path_to_fs_path(lua_path)
  -- Replace all periods with the correct directory separator.
  local fs_path = string.gsub(lua_path, "%.", "/")
  -- Append the .lua extension.
  return fs_path .. ".lua"
end

--- Smart 'go to file' function with Lua module path recognition.
function M.smart_gf()
  local path_under_cursor = vim.fn.expand('<cfile>')
  if path_under_cursor == '' then
    return
  end

  local final_path

  -- Check if the path is a Lua module path (contains '.' but no '/' or '\').
  if string.find(path_under_cursor, "%.") and not string.find(path_under_cursor, "[/\\]") then

    -- It's a Lua module path.
    -- Get the Neovim config directory and construct the full path.
    local config_dir = vim.fn.stdpath("config")
    local fs_path = convert_lua_path_to_fs_path(path_under_cursor)
    final_path = config_dir .. "/lua/" .. fs_path
  else

    -- It's a standard filesystem path.
    final_path = vim.fn.fnamemodify(path_under_cursor, ':p')
  end

  local directory = vim.fn.fnamemodify(final_path, ':h')

  -- Check if the directory exists and create it if necessary.
  local directory_stat = vim.uv.fs_stat(directory)
  if not directory_stat then
    vim.uv.fs_mkdir(directory, { recursive = true }, function(err)
      if err then
        vim.notify("Failed to create directory: " .. err, vim.log.levels.ERROR)
      end
    end)
  end

  -- Check if the file exists.
  local file_stat = vim.uv.fs_stat(final_path)
  local path_to_open = final_path

  if not file_stat then

    -- File does not exist.
    -- Check if the path already has a file extension (other than .lua, which we already added).
    local has_extension = vim.fn.fnamemodify(final_path, ':e') ~= ''

    if not has_extension and vim.fn.fnamemodify(final_path, ':e') ~= 'lua' then

      -- Prompt the user for a file extension.
      local extension = vim.fn.input('Enter file extension: ', '', 'file')
      if extension and #extension > 0 then
        path_to_open = final_path .. '.' .. extension
      end
    end
  end

  -- Go to the file (either the existing one or the newly created one).
  vim.cmd.edit(path_to_open)
end

return M

--------------------------------------------------------------------------------
-- Wipe all settable registers
--------------------------------------------------------------------------------
local function wipe_all_registers()

	-- Named registers (a-z)
	for i = string.byte("a"), string.byte("z") do
		pcall(vim.fn.setreg, string.char(i), {}) -- Empty list for full wipe
	end

	-- Numbered registers (0-9)
	for i = 0, 9 do
		pcall(vim.fn.setreg, tostring(i), "") -- Empty string
	end

	-- Small delete register (-)
	pcall(vim.fn.setreg, "-", "")

	-- Search register (/)
	pcall(vim.fn.setreg, "/", "")

	-- Clipboard registers (* and +)
	pcall(vim.fn.setreg, "*", "")
	pcall(vim.fn.setreg, "+", "")
end

-- Custom command to call the function
vim.api.nvim_create_user_command("WipeRegs", wipe_all_registers, {
	desc = "Wipe all settable registers",
})

--------------------------------------------------------------------------------
-- Plugin Repo Conversion
--------------------------------------------------------------------------------
--- @param url string
function PluginRepoUrl(url)

  -- remove query or fragment identifiers from url
  local clean_url = string.gsub(url, "([?#].*)$","")

  -- match url pattern
  -- create regex for user and repo name
  local pattern = "github%.com/[^/]+/[^/]+"
  local match_start, match_end = string.find(url, pattern)

  if match_start then

    -- Extract the full matched string (e.g., "github.com/neovim/neovim")
    local full_match = string.sub(clean_url, match_start, match_end)

    -- Remove the "github.com/" prefix to get just "user/repo"
    local user_repo = string.gsub(full_match, "github%.com/", "")
    return user_repo
  else

    -- If no match is found, return nil (or an empty string, or an error message)
    return nil
  end
end

_G.Plugin = PluginRepoUrl

--------------------------------------------------------------------------------
--- Custom call for plugins
--------------------------------------------------------------------------------

--- Helper function to abstract the Plugin and table.insert calls
--- @param url string
--- @param options table|nil
local function add(url, opts)
  -- use global variable Plugin from core.functions
  local plugin_repo = Plugin(url)

  if plugin_repo then

    -- Returns the standard `User/Repo` format
    local plugin_spec = { plugin_repo }

    if opts then
      for k, v in pairs(opts) do
        plugin_spec[k] = v
      end
    end

    -- Insert the constructed plugin specification into the main 'plugins' table
    table.insert(plugins, plugin_spec)
  else
    print("Warning: Could not extract user/repo for plugin from URL: " .. url)
  end
end

--- @param urls string|table
--- @return single|table
local function deps_from_urls(urls)
  if type(urls) == "string" then

    -- If a single URL, process it and returns the standard "user/repo" format
    return Plugin(urls)
  elseif type(urls) == "table" then

    --if a table of URLs, iterate and properly process to the standard format
    local processed_deps = {}
    for _, dep_url in ipairs(urls) do
      local repo_dep = Plugin(dep_url)
      if repo_dep then
        table.insert(processed_deps, repo_dep)
      else
    print("Warning: Could not extract user/repo for dependency from URL: " .. url)
      end
    end
    return processed_deps
  end
  return nil
end
_G.add = add


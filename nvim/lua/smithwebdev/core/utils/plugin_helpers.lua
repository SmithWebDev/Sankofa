--------------------------------------------------------------------------------
-- Sankofa Plugin Utility
--------------------------------------------------------------------------------

--- @param url string The full GitHub repository URL.
local function PluginRepoUrl(url)

  -- remove query or fragment identifiers from url
  local clean_url = string.gsub(url, "([?#].*)$","")

  -- match url pattern
  -- create regex for user and repo name
  local pattern = "github%.com/[^/]+/[^/]+"
  local match_start, match_end = string.find(clean_url, pattern)

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

-- Assigns module name that will serve as global scope for plugins
local SankofaPlugins = {

-- Internal table to store plugin specs
  _plugin_specs = {},
}

--- Adds a plugin specification to the internal list for Lazy.nvim.
--- @param url string The full GitHub repository URL.
--- @param opts table|nil Optional: A table of additional Lazy.nvim options.
function SankofaPlugins.add(url, opts)
  local user_repo = PluginRepoUrl(url)

  if user_repo then
    local plugin_spec = { user_repo }
    if opts then
      for k, v in pairs(opts) do
        plugin_spec[k] = v
      end
    end
    table.insert(SankofaPlugins._plugin_specs, plugin_spec)
  else
    vim.notify("Warning: Could not extract user/repo for plugin from URL: " .. url)
  end
end

--- Transforms URLs into Lazy.nvim dependency format.
--- @param urls string|table A single URL or a table of URLs.
--- @return string|table The "user/repo" string or a table of "user/repo" strings.
function SankofaPlugins.deps_from_urls(urls)
  if type(urls) == "string" then
    return PluginRepoUrl(urls)
  elseif type(urls) == "table" then
    local processed_deps = {}
    for _, dep_url in ipairs(urls) do
      local user_repo_dep = PluginRepoUrl(dep_url)
      if user_repo_dep then
        table.insert(processed_deps, user_repo_dep)
      else
        vim.notify("Warning: Could not extract user/repo for dependency from URL: " .. dep_url)
      end
    end
    return processed_deps
  end
  return nil
end

--- Function to retrieve all collected plugin specs.
function SankofaPlugins.get_all_plugins()
  return SankofaPlugins._plugin_specs
end

-- Make the SankofaPlugins table (and its functions) available globally.
_G.SankofaPlugins = SankofaPlugins

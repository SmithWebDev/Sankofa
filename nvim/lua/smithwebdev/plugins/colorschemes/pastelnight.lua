require("pastelnight").setup({
  --- The theme comes in two styles, `default` and `highContrast`.
  style = "default",

  --- Enable this to disable setting the background color.
  transparent = false,

  --- Configure the colors used when opening a `:terminal`.
  terminal_colors = true,

  styles = {

    --- Style to be applied to different syntax groups.
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},

    --- Background styles. Can be 'dark', 'transparent' or 'normal'.
    sidebars = "dark",
    floats = "dark",
  },

  --- Set a darker background on sidebar-like windows. ['terminal', 'packer'...].
  sidebars = { "qf", "help", 'neotree' },

  --- Enabling this option, will hide inactive statuslines and replace them
  ---with a thin border instead.
  hide_inactive_statusline = false,

  --- dims inactive windows.
  dim_inactive = false,

  --- When true, section headers in the lualine theme will be bold.
  lualine_bold = false,

  --- You can override specific color groups to use other groups or a hex color,
  --- function will be called with a ColorScheme table.
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color,
  --- function will be called with a Highlights and ColorScheme table.
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})


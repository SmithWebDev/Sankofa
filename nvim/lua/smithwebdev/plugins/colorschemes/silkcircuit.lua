require("silkcircuit").setup({
  transparent = false,     -- Enable transparent background
  terminal_colors = true,  -- Configure terminal colors
  dim_inactive = false,    -- Dim inactive windows
  variant = "neon",       -- Theme variant: "neon" | "vibrant" | "soft" | "glow"

  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true, italic = true },
    variables = {},
    strings = { italic = true },
  },

  integrations = {
    -- Auto-detected by default
    telescope = true,
    neotree = true,
    notify = true,
    cmp = true,
    mini = true,
    -- See :h silkcircuit-integrations for full list
  },
})

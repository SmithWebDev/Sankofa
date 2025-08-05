require("xcodedark").setup({
  -- New color scheme with your specifications
  transparent = false, -- or false if you prefer solid background

  integrations = {
    telescope = true,
    nvim_tree = true,
    gitsigns = true,
    bufferline = true,
    incline = true,
    lazygit = true,
    which_key = true,
    notify = true,
  },

  -- Font weight customization
  styles = {
    comments = { italic = true }, -- Comments: italic, normal weight (SF Mono Light Medium)
    keywords = { bold = true }, -- Keywords: bold (already configured)
    functions = {}, -- Functions: SF Mono Light Medium
    variables = {}, -- Variables: SF Mono Light Medium  
    strings = {}, -- Strings: SF Mono Light Medium
    booleans = { bold = true }, -- Booleans: bold
    types = {}, -- Types: SF Mono Light Medium
    constants = {}, -- Constants: SF Mono Light Medium
    operators = {}, -- Operators: SF Mono Light Medium
    punctuation = {}, -- Punctuation: SF Mono Light Medium
  },

  terminal_colors = true,
})

--- Colorschemes
SankofaPlugins.add("https://github.com/pauchiner/pastelnight.nvim", {
  config = function()
    require"smithwebdev.plugins.colorschemes.pastelnight"
  end})
SankofaPlugins.add("https://github.com/folke/tokyonight.nvim", {
  config = function()
    require"smithwebdev.plugins.colorschemes.tokyonight"
  end})
SankofaPlugins.add("https://github.com/hyperb1iss/silkcircuit-nvim",{
  priority = 1000,
  config = function()
    require"smithwebdev.plugins.colorschemes.silkcircuit"
  end })
SankofaPlugins.add("https://github.com/V4N1LLA-1CE/xcodedark.nvim", {
  config = function()
    require'smithwebdev.plugins.colorschemes.xcodedark'
  end })
SankofaPlugins.add("https://github.com/nvim-telescope/telescope.nvim", {
  keys = {
    {"<leader>ff"},
    {"<leader>fF"},
    {"<leader>fg"},
  },
  config = function()
    require'smithwebdev.plugins.navigation.telescope'
  end })
--- TUI Integration
SankofaPlugins.add("https://github.com/kdheepak/lazygit.nvim", {
  keys = { "<leader>gl" },
  config = function()
    vim.keymap.set('n', '<leader>gl', "<cmd>LazyGit<cr>", {desc = 'LazyGit'})
  end
})

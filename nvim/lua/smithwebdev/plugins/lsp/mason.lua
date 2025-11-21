-- import mason plugin
local mason = require'mason'

-- import mason_lspconfig  plugin
local mason_lspconfig = require('mason-lspconfig')

-- import mason_tool_installer
local mason_tool_installer = require('mason-tool-installer')


mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "ruby_lsp",
  },
})


vim.lsp.enable("lua_ls")

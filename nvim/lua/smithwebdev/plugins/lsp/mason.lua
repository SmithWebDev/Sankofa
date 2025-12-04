-- import mason plugin
local mason = require 'mason'

-- import mason_lspconfig  plugin
local mason_lspconfig = require('mason-lspconfig')

-- import mason_tool_installer
local mason_tool_installer = require('mason-tool-installer')


mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "herb_ls",
    "lua_ls",
    "ruby_lsp",
    "stimulus_ls",
  },
})

-- Herb LSP
vim.lsp.enable("herb_ls")

-- Lua LSP
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      hint = { enable = true },
    },
  },
})
vim.lsp.enable("lua_ls")

-- Ruby LSP
local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
      local params = vim.lsp.util.make_text_document_params()
      local showAll = opts.args == "all"

      client.request("rubyLsp/workspace/dependencies", params, function(error, result)
        if error then
          print("Error showing deps: " .. error)
          return
        end

        local qf_list = {}
        for _, item in ipairs(result) do
          if showAll or item.dependency then
            table.insert(qf_list, {
              text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
              filename = item.path
            })
          end
        end

        vim.fn.setqflist(qf_list)
        vim.cmd('copen')
      end, bufnr)
    end,
    { nargs = "?", complete = function() return { "all" } end })
end

vim.lsp.config("ruby_lsp", {
  init_options = {
    enabledFeatures = {
      codeActions = true,
      codeLens = true,
      completion = true,
      definition = true,
      diagnostics = true,
      documentHighlights = true,
      documentLink = true,
      documentSymbols = true,
      foldingRanges = true,
      formatting = true,
      hover = true,
      inlayHint = true,
      onTypeFormatting = true,
      selectionRanges = true,
      semanticHighlighting = true,
      signatureHelp = true,
      typeHierarchy = true,
      workspaceSymbol = true,
    },
    experimentalFeaturesEnabled = false,
    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = true,
        implicitRescue = true,
      },
    },
    formatter = 'standard',
    linters = { 'standard' },
    addonSettings = {
      ["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false, },
      -- ["Ruby LSP RSpec"] = { ... }, -- if you add the RSpec add-on gem
    },
  },
  root_markers = { "Gemfile", ".git" },
  on_attach = function(client, buffer)
    add_ruby_deps_command(client, buffer)
  end,
})
vim.lsp.enable("ruby_lsp")

-- Stimulus LSP
vim.lsp.enable("stimulus_ls")


vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = '', silent = true, noremap = true })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = '', silent = true, noremap = true })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = '', silent = true, noremap = true })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = '', silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = '', silent = true, noremap = true })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '', silent = true, noremap = true })
vim.keymap.set('n', '<leader>lh', function ()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, { desc = '', silent = true, noremap = true })


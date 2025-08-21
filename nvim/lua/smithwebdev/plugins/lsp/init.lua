-- Mason setup
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local servers = {
  "cssls",
  "css_variables",
  "emmet_ls",
  "html",
  "jsonls",
  "lua_ls",
  "markdown_oxide",
  "rubocop",
  "ruby_lsp",
  "somesass_ls",
  "stimulus_ls",
  "tailwindcss",
  "ts_ls",
  "yamlls",
}

mason.setup()

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_enable = false
})

-- Diagnostic UI
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local lspconfig = require("lspconfig")

-- Capabilities from blink.cmp
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- on_attach with duplicate prevention
local on_attach = function(client, bufnr)
  local navbuddy_status, navbuddy = pcall(require, 'navbuddy')
  if not navbuddy_status then 
    return
  end

  -- Prevent multiple clients of same name attaching
  for _, c in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if c.name == client.name and c.id ~= client.id then
      vim.lsp.stop_client(client.id)
      return
    end
  end

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  navbuddy.attach(client, bufnr)

  map("n", "<leader>ld", vim.lsp.buf.definition, "Lsp Definition")
  map("n", "<leader>l<space>", vim.lsp.buf.hover, "Lsp Hover")
  map("n", "<leader>li", vim.lsp.buf.implementation, "Lsp Implementation")
  map("n", "<leader>lD", vim.lsp.buf.type_definition, "Lsp Type Definition")
  map("n", "<leader>lrn", vim.lsp.buf.rename, "Lsp Rename")
  map({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, "Lsp Code Action")
  map("n", "<leader>lr", vim.lsp.buf.references, "Lsp References")

  map("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, "Lsp Format")

  -- Open the diagnostic under the cursor in a float window
  map("n", "<leader>lo", function()
    vim.diagnostic.open_float({
      border = "rounded",
    })
  end, "Lsp Diagnostic Float")

  map('n', "<leader>lih", function ()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, "Toggle Inlay Hints")
end


-- Helper: check if file exists
local function file_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "file"
end


local function ruby_lsp_cmd()
  if file_exists(vim.fn.getcwd() .. "/Gemfile") then
    return { "bundle", "exec", "ruby-lsp" }
  else
    return { "ruby-lsp" } -- fallback to global
  end
end
-- Server-specific settings
local server_settings = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        telemetry = { enable = false },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
  ruby_lsp = {
    cmd = ruby_lsp_cmd(),
    -- { "bundle", "exec", "ruby-lsp" },
    init_options = {
      enabledFeatures = {
        "codeActions",
        "diagnostics",
        "documentHighlights",
        "documentSymbols",
        "formatting",
        "inlayHint",
        "selectionRanges",
        "semanticHighlighting",
        "workspaceSymbol",
        -- Ruby-specific extensions
        "rubyLspRails",
        "rubyLspRSpec",
      },
      formatter = 'auto'
    },
  },
}

-- Setup handlers
for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server_settings[server] then
    opts = vim.tbl_deep_extend("force", opts, server_settings[server])
  end

  if lspconfig[server] then
    lspconfig[server].setup(opts)
  else
    vim.notify("LSP server not available in lspconfig: " .. server, vim.log.levels.WARN)
  end
end

-- Mason + Mason-LSPConfig ----------------------------------------
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local util = require("lspconfig.util")

local servers = {
  "cssls", "css_variables", "emmet_ls", "html", "jsonls",
  "lua_ls", "markdown_oxide", "rubocop", "ruby_lsp",
  "somesass_ls", "stimulus_ls", "herb_ls",
  "tailwindcss", "ts_ls", "yamlls",
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

-- Diagnostics UI -------------------------------------------------
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP Setup ------------------------------------------------------
local capabilities = require("blink.cmp").get_lsp_capabilities()
--
-- LSP capabilities: enable Folding Range BEFORE your LSP setup ----------------
capabilities.textDocument = capabilities.textDocument or {}
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

-- Helpers --------------------------------------------------------
local function set_lsp_keymaps(bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  map("n", "<leader>ld", vim.lsp.buf.definition, "Definition")
  map("n", "<leader>l<space>", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>li", vim.lsp.buf.implementation, "Implementation")
  map("n", "<leader>lD", vim.lsp.buf.type_definition, "Type Definition")
  map("n", "<leader>lrn", vim.lsp.buf.rename, "Rename")
  map({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>lr", vim.lsp.buf.references, "References")
  map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")
  map("n", "<leader>lo", function() vim.diagnostic.open_float({ border = "rounded" }) end, "Diagnostics Float")

  -- Correct, buffer-local inlay-hint toggle
  map("n", "<leader>lih", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  end, "Toggle Inlay Hints")
end

local function on_attach(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

  local ok, navbuddy = pcall(require, "navbuddy")
  if ok then navbuddy.attach(client, bufnr) end

  set_lsp_keymaps(bufnr)
end

-- Server-specific settings (built-ins) ---------------------------
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
}

-- 0.11+ config chain: defaults, per-server overrides --------------
vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", server_settings.lua_ls)

-- Official Ruby LSP configuration --------------------------------
vim.lsp.config("ruby_lsp", {
  filetypes = { "ruby" },
  -- Choose ONE approach for the command, per your environment:
  -- cmd = { "bundle", "exec", "ruby-lsp" },                 -- safest cross-project
  -- cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },      -- example: asdf shim
  cmd = { "ruby-lsp" },                                      -- works if editor launched in correct env
  root_markers = { "Gemfile", ".git" },
  init_options = {
    formatter = "standard",
    linters = { "standard" },

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

    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = true,
        implicitRescue = true,
      },
    },

    indexing = {
      excludedPatterns = {},
      includedPatterns = {},
      excludedGems = {},
      excludedMagicComments = {},
    },

    experimentalFeaturesEnabled = false,

    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
      -- ["Ruby LSP RSpec"] = { ... }, -- if you add the RSpec add-on gem
      -- ["Standard"] = { ... },       -- typically controlled via formatter/linters above
    },
  },
})

-- Custom servers (not in upstream nvim-lspconfig) ----------------
vim.lsp.config("css_variables", {
  cmd = { "css-variables-language-server", "--stdio" },
  filetypes = { "css", "scss", "sass", "less" },
  root_dir = util.root_pattern(".git"),
})

vim.lsp.config("somesass_ls", {
  cmd = { "some-sass-language-server", "--stdio" },
  filetypes = { "scss", "sass", "css" },
  root_dir = util.root_pattern(".git"),
})

vim.lsp.config("stimulus_ls", {
  cmd = { "stimulus-language-server", "--stdio" },
  filetypes = { "html", "eruby", "javascript", "typescript" },
  root_dir = function(fname)
    return util.root_pattern("Gemfile", "package.json", ".git")(fname)
      or vim.fs.dirname(fname)
  end,
})

vim.lsp.config("herb_ls", {
  cmd = { "herb-language-server", "--stdio" },
  filetypes = { "eruby", "erb" },
  root_dir = util.root_pattern("Gemfile", ".git"),
})

vim.lsp.config("rubocop", {
  cmd = (vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), "Gemfile")))
      and { "bundle", "exec", "rubocop", "--lsp" }
      or { "rubocop", "--lsp" },
  filetypes = { "ruby" },
  root_dir = util.root_pattern("Gemfile", ".git"),
})

vim.lsp.config("markdown_oxide", {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    workspace = { didChangeWatchedFiles = { dynamicRegistration = true } },
  }),
  root_dir = util.root_pattern(".git"),
})

-- Enable everything ----------------------------------------------
vim.lsp.enable(servers)

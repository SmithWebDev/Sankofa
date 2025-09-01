-- Neotest ------------------------------------------------
local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-vim-test")({
      -- Let dedicated adapters handle their langs
      ignore_file_types = { "vim", "lua", "ruby" },
    }),
    require("neotest-minitest"),
    require("neotest-rspec"),
  },

  benchmark = { enabled = true },

  consumers = {},
  default_strategy = "integrated",

  diagnostic = {
    enabled = true,
    -- Prefer Neovim constants over raw numbers
    severity = vim.diagnostic.severity.ERROR,
  },

  discovery = {
    -- Avoid unlimited concurrency on large repos
    concurrent = 3,
    enabled = true,
  },

  floating = {
    border = "rounded",
    max_height = 0.6,
    max_width = 0.6,
    options = {},
  },

  highlights = {
    adapter_name = "NeotestAdapterName",
    border = "NeotestBorder",
    dir = "NeotestDir",
    expand_marker = "NeotestExpandMarker",
    failed = "NeotestFailed",
    file = "NeotestFile",
    focused = "NeotestFocused",
    indent = "NeotestIndent",
    marked = "NeotestMarked",
    namespace = "NeotestNamespace",
    passed = "NeotestPassed",
    running = "NeotestRunning",
    select_win = "NeotestWinSelect",
    skipped = "NeotestSkipped",
    target = "NeotestTarget",
    test = "NeotestTest",
    unknown = "NeotestUnknown",
    watching = "NeotestWatching",
  },

  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "",
    running = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "",
    unknown = "",
    watching = "",
  },

  jump = { enabled = true },

  log_level = 3,

  output = {
    enabled = true,
    -- Use boolean or function; strings like "short" aren’t supported
    open_on_run = true,
  },

  output_panel = {
    enabled = true,
    -- Function wrapper is safer and version-agnostic
    open = function()
      vim.cmd("botright split | resize 15")
    end,
  },

  projects = {},

  quickfix = { enabled = true, open = false },

  run = { enabled = true },

  running = { concurrent = true },

  state = { enabled = true },

  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },

  strategies = {
    integrated = { height = 40, width = 120 },
  },

  summary = {
    animated = true,
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      clear_marked = "M",
      clear_target = "T",
      debug = "d",
      debug_marked = "D",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",  -- keep if supported in your installed version
      mark = "m",
      next_failed = "J",
      output = "o",
      prev_failed = "K",
      run = "r",
      run_marked = "R",
      short = "O",   -- keep if documented in your version
      stop = "u",
      target = "t",
      watch = "w",
    },
    open = "botright vsplit | vertical resize 50",
  },

  watch = {
    enabled = true,
    symbol_queries = {},
  },
})

-- Keymaps ---------------------------------------------------------
vim.keymap.set('n', "<leader>ta",  function() require("neotest").run.attach() end,                     { desc = "Attach Test" })
vim.keymap.set('n', "<leader>tcf", function() require("neotest").run.run(vim.fn.expand("%")) end,      { desc = "Run All Tests in Current File" })
vim.keymap.set('n', "]t",          function() require("neotest").jump.next() end,                      { desc = "Jump to Next Test" })
vim.keymap.set('n', "[t",          function() require("neotest").jump.prev() end,                      { desc = "Jump to Previous Test" })
-- Optional: failed-only jumps
vim.keymap.set('n', "]T",          function() require("neotest").jump.next({ status = "failed" }) end, { desc = "Jump to Next Failed Test" })
vim.keymap.set('n', "[T",          function() require("neotest").jump.prev({ status = "failed" }) end, { desc = "Jump to Previous Failed Test" })

vim.keymap.set('n', "<leader>tn",  function() require("neotest").run.run() end,                        { desc = "Run Nearest Test" })
vim.keymap.set('n', "<leader>tr",  function() require("neotest").output.open() end,                    { desc = "Open Per-Test Output" })
vim.keymap.set('n', "<leader>to",  function() require("neotest").output_panel.toggle() end,            { desc = "Toggle Output Panel" })
vim.keymap.set('n', "<leader>ts",  function() require("neotest").summary.toggle() end,                 { desc = "Toggle Summary Window" })
vim.keymap.set('n', "<leader>tu",  function() require("neotest").summary.clear_marked() end,           { desc = "Clear Marked Tests" })
vim.keymap.set('n', "<leader>tw",  function() require("neotest").watch.toggle(vim.fn.expand("%")) end, { desc = "Watch current file for changes" })
vim.keymap.set('n', "<leader>tW",  function() require("neotest").watch.stop() end,                     { desc = "Stop watching current file(s) for changes" })
vim.keymap.set('n', "<leader>tx",  function() require("neotest").run.stop() end,                       { desc = "Stop Running Tests" })
vim.keymap.set('n', "<leader>tz",  function() require("neotest").summary.run_marked() end,             { desc = "Run Marked Tests" })

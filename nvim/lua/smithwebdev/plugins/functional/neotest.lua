require("neotest").setup({
  adapters = {
    require("neotest-vim-test")({
      ignore_file_types = { "vim", "lua", "ruby" },
    }),
    require('neotest-minitest'),
    require("neotest-rspec"),
  },
  benchmark = {
    enabled = true,
  },
  consumers = {},
  default_strategy = "integrated",
  diagnostic = {
    enabled = true,
    severity = 1,
  },
  discovery = {
    concurrent = 0,
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
  jump = {
    enabled = true,
  },
  log_level = 3,
  output = {
    enabled = true,
    open_on_run = "short",
  },
  output_panel = {
    enabled = true,
    open = "botright split | resize 15",
  },
  projects = {},
  quickfix = {
    enabled = true,
    open = false,
  },
  run = {
    enabled = true,
  },
  running = {
    concurrent = true,
  },
  state = {
    enabled = true,
  },
  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },
  strategies = {
    integrated = {
      height = 40,
      width = 120,
    },
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
      jumpto = "i",
      mark = "m",
      next_failed = "J",
      output = "o",
      prev_failed = "K",
      run = "r",
      run_marked = "R",
      short = "O",
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

-- TODO: Decide on a keybind strategy <smithwebdev> 
vim.keymap.set('n', "<leader>tna",  function() require("neotest").run.attach() end,                     {desc = "Attach Test"})
vim.keymap.set('n', "<leader>tncf", function() require("neotest").run.run(vim.fn.expand("%")) end,      {desc = "Run All Test Current File"})
vim.keymap.set('n', "]t",       function() require("neotest").jump.next() end,                      {desc = "Jump to Next Test"})
vim.keymap.set('n', "[t",       function() require("neotest").jump.prev() end,                      {desc = "Jump to Previous Test"})
vim.keymap.set('n', "<leader>tnn",  function() require("neotest").run.run() end,                        {desc = "Run Nearest Test Current File"})
vim.keymap.set('n', "<leader>tnr",  function() require("neotest").output.open() end,                    {desc = "Toggle Test Result Window"})
vim.keymap.set('n', "<leader>tno",  function() require("neotest").output_panel.toggle() end,            {desc = "Toggle Test Result Window"})
vim.keymap.set('n', "<leader>tns",  function() require("neotest").summary.toggle() end,                 {desc = "Toggle Summary Window"})
vim.keymap.set('n', "<leader>tnu",  function() require("neotest").summary.clear_marked() end,           {desc = "Clear Marked Tests"})
vim.keymap.set('n', "<leader>tnw",  function() require("neotest").watch.toggle(vim.fn.expand("%")) end, {desc = "Watch current file for changes"})
vim.keymap.set('n', "<leader>tnW",  function() require("neotest").watch.stop() end,                     {desc = "Stop watching current file(s) for changes"})
vim.keymap.set('n', "<leader>tnx",  function() require("neotest").run.stop() end,                       {desc = "Stop Running Tests"})
vim.keymap.set('n', "<leader>tnz",  function() require("neotest").summary.run_marked() end,             {desc = "Run Marked Tests"})

    -- function() require('neotest').run.run({status = 'failed'})


-- Core DAP pieces ------------------------------------------------
local dap, dapui, dap_ruby = require('dap'), require('dapui'), require('dap-ruby')

dapui.setup()
dap_ruby.setup() -- establishes Ruby adapter/config via rdbg

-- Always-available keymaps ---------------------------------------
-- Toggle UI: available even when no session is running
vim.keymap.set('n', '<leader>du', function() dapui.toggle() end, { desc = "DAP UI Toggle" })

-- Toggle breakpoint: should work any time
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Toggle Debug Breakpoint" })

-- which-key (optional, non-blocking) ------------------------------
pcall(function()
  local wk = require('which-key')
  wk.add({
    { '<leader>d',  group = "Debugger" },
    { '<leader>du', desc  = "DAP UI Toggle" },
    { '<leader>db', desc  = "Toggle Breakpoint" },
  })
end)

-- Session-scoped keymaps -----------------------------------------
-- We create these when a session starts, and remove them when it ends.
local function set_session_keymaps()
  -- core controls
  vim.keymap.set('n', '<leader>dc', dap.continue,  { desc = "Continue Debug",   nowait = true, silent = true })
  vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "Open REPL",        nowait = true, silent = true })
  vim.keymap.set('n', '<leader>dl', dap.run_last,  { desc = "Run Last",         nowait = true, silent = true })

  -- stepping
  vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "Step Over", nowait = true, silent = true })
  vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "Step Into", nowait = true, silent = true })
  vim.keymap.set('n', '<F12>', function() dap.step_out()  end, { desc = "Step Out",  nowait = true, silent = true })

  -- widgets
  vim.keymap.set({ 'n', 'v' }, '<leader>Dh', function() require('dap.ui.widgets').hover() end,   { desc = "DAP Hover" })
  vim.keymap.set({ 'n', 'v' }, '<leader>Dp', function() require('dap.ui.widgets').preview() end, { desc = "DAP Preview" })
  vim.keymap.set('n', '<leader>Df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end, { desc = "DAP Frames" })
  vim.keymap.set('n', '<leader>Ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end, { desc = "DAP Scopes" })

  -- log point helper
  vim.keymap.set('n', '<leader>Dlp', function()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end, { desc = "Set Log Point" })

  -- Neotest: DAP-powered test runs (safe-guarded; only defined if neotest is present)
  pcall(function()
    local neotest = require('neotest')
    vim.keymap.set('n', '<leader>tdn', function()
      neotest.run.run({ strategy = 'dap' })
    end, { desc = "Debug Nearest Test (DAP)" })
    vim.keymap.set('n', '<leader>tdf', function()
      neotest.run.run(vim.fn.expand('%'), { strategy = 'dap' })
    end, { desc = "Debug Current File Tests (DAP)" })
  end)
end

local function del_session_keymaps()
  local del = vim.keymap.del
  -- core controls
  pcall(del, 'n', '<leader>dc'); pcall(del, 'n', '<leader>dr'); pcall(del, 'n', '<leader>dl')
  -- stepping
  pcall(del, 'n', '<F10>'); pcall(del, 'n', '<F11>'); pcall(del, 'n', '<F12>')
  -- widgets & helpers
  pcall(del, { 'n', 'v' }, '<leader>Dh'); pcall(del, { 'n', 'v' }, '<leader>Dp')
  pcall(del, 'n', '<leader>Df'); pcall(del, 'n', '<leader>Ds'); pcall(del, 'n', '<leader>Dlp')
  -- neotest (only if they existed)
  pcall(del, 'n', '<leader>tdn'); pcall(del, 'n', '<leader>tdf')
end

-- Open/close UI + manage session-scoped maps ---------------------
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  set_session_keymaps()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  del_session_keymaps()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  del_session_keymaps()
  dapui.close()
end

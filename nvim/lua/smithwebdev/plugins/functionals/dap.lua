local dap, dapui,dap_ruby = require('dap'), require('dapui'), require('dap-ruby')
dapui.setup()
dap_ruby.setup()

dap.listeners.before.attach.dapui_config = function ()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function ()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function ()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function ()
  dapui.close()
end

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {desc = "Toggle Debug Breakpoint"})
vim.keymap.set('n', '<leader>dc', dap.continue, {desc = "Continue Debug"})
vim.keymap.set('n', '<Leader>dr', dap.repl.open, {desc = "Open Repl"})
vim.keymap.set('n', '<Leader>dl', dap.run_last, {desc = "Run Last"})

-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)

local which_key_status, which_key = pcall(require, 'which-key')
if not which_key_status then
  return
end

which_key.add({
  {'<leader>d', desc = "Debugger" }
})

-- Adapters & Configurations
--------------------------------------------------------------------------------
dap.adapters.ruby = function(callback, config)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "bundle",
      args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
        "-c", "--", "bundle", "exec", config.command, config.script,
      },
    },
  }
end

-- dap.configurations.ruby = {
--   {
--     type = "ruby",
--     name = "debug current file",
--     request = "attach",
--     localfs = true,
--     command = "ruby",
--     script = "${file}",
--   },
--   {
--     type = "ruby",
--     name = "run current spec file",
--     request = "attach",
--     localfs = true,
--     command = "rspec",
--     script = "${file}",
--   },
-- }

-- dap.configurations.ruby = {
--   {
--     type = "ruby", -- provided by nvim-dap-ruby
--     request = "attach",
--     name = "Attach Rails (38698)",
--     host = "127.0.0.1",
--     port = 38698,
--   },
-- }

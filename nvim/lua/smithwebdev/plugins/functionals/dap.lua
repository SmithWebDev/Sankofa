local dap = require('dap')

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


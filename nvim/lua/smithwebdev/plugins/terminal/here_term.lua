require("here-term").setup({
    -- The command we run when exiting the terminal and no other buffers are listed. An empty
    -- buffer is shown by default. 
    -- startup_command = "enew", -- Startify, Dashboard, etc. Make sure it has been loaded before `here.term`.

    -- Mappings
    -- Every mapping bellow can be customized by providing your preferred combo, or disabled
    -- entirely by setting them to `nil`.
    --
    -- The minimal mappings used to toggle and kill the terminal. Available in
    -- `normal` and `terminal` mode.
    -- mappings = {
    --     toggle = "<C-;>",
    --     kill = "<C-S-;>",
    -- },
    -- Additional mappings that I consider useful since you won't have to escape (<C-\><C-n>)
    -- the terminal each time. Available in `terminal` mode.
    extra_mappings = {
        enable = true, -- Disable them entirely
        escape = "<C-x>", -- Escape terminal mode
        left = "<C-h", -- Move to the left window
        down = "<C-j", -- Move to the window down
        up = "<C-k", -- Move to the window up
        right = "<C-l", -- Move to right window
    },
})


vim.keymap.set('n', '<C-;>', ":lua require('here-term').toggle_terminal()<CR>", { desc = 'Toggle Terminal In Buffer', silent = true, noremap = true })


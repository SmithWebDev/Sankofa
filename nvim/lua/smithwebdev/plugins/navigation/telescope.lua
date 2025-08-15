local telescope = require("telescope")
local actions = require("telescope.actions")
local Layout = require("telescope.pickers.layout")
local which_key_status, which_key = pcall(require, 'which-key')
if not which_key_status then 
  return
end

require("telescope").setup({
	defaults = {
		--layout_config = { prompt_position = 'bottom' },
		--layout_strategy = 'horizontal',
		--sorting_strategy = 'descending',
		mappings = {
			["i"] = {
				--['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon,
				--['<esc>'] = require("telescope.actions").close,
				--['<C-s>'] = require('telescope.actions').add_selection,
				--['<C-x>'] = require('telescope.actions').remove_selection,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				--['<C-v>'] = require('telescope.actions').move_selection_previous,
				--['<leader>-'] = require('telescope.actions').select_horizontal,
				--['<leader>\\'] = require('telescope.actions').select_vertical,
				--['<C-h>'] = require('telescope.actions').add_to_qflist,
				--['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			["n"] = {
				--['<c-h>'] = telescope.extensions.send_to_harpoon.actions.send_selected_to_harpoon,
				["q"] = require("telescope.actions").close,
				--['<C-s>'] = require('telescope.actions').add_selection,
				--['<C-x>'] = require('telescope.actions').remove_selection,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				--['-'] = require('telescope.actions').select_horizontal,
				--['\\'] = require('telescope.actions').select_vertical,
				--['t'] = require('telescope.actions').select_tab,
				--['<C-h>'] = require('telescope.actions').add_to_qflist,
				--['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
				--['<C-q>'] = require('telescope.actions').send_selected_to_qflist,
				--['q'] = require('telescope.actions').open_qflist,
				--['?'] = require('telescope.actions').which_key,
			},
		},
		file_ignore_patterns = {
			"^vendor/bundle/",
		},
	},
	extensions = {
		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
		},
	},
	pickers = {
		layout = {
			create_layout = function(picker)
				local function create_window(enter, width, height, row, col, title)
					local bufnr = vim.api.nvim_create_buf(false, true)
					local winid = vim.api.nvim_open_win(bufnr, enter, {
						style = "minimal",
						relative = "editor",
						width = width,
						height = height,
						row = row,
						col = col,
						border = "single",
						title = title,
					})

					vim.wo[winid].winhighlight = "Normal:Normal"

					return Layout.Window({
						bufnr = bufnr,
						winid = winid,
					})
				end

				local function destory_window(window)
					if window then
						if vim.api.nvim_win_is_valid(window.winid) then
							vim.api.nvim_win_close(window.winid, true)
						end
						if vim.api.nvim_buf_is_valid(window.bufnr) then
							vim.api.nvim_buf_delete(window.bufnr, { force = true })
						end
					end
				end

				local layout = Layout({
					picker = picker,
					mount = function(self)
						self.results = create_window(false, 40, 20, 0, 0, "Results")
						self.preview = create_window(false, 40, 23, 0, 42, "Preview")
						self.prompt = create_window(true, 40, 1, 22, 0, "Prompt")
					end,
					unmount = function(self)
						destory_window(self.results)
						destory_window(self.preview)
						destory_window(self.prompt)
					end,
					update = function(self) end,
				})

				return layout
			end,
		},
	},
})

which_key.add({
  {'<leader>f', desc = "Telescope Find .."}
})

require("telescope").setup({})
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
	vim.opt.foldenable = false
end, { desc = "Telescope Find Files" })

vim.keymap.set("n", "<leader>fF", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "", silent = true, noremap = true })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Telescope Find Files", silent = true, noremap = true })

vim.keymap.set(
	"n",
	"<leader>fk",
	":Telescope keymaps<CR>",
	{ desc = "Telescope Find Keymaps", silent = true, noremap = true }
)
-- telescope.load_extension("directory")
-- telescope.load_extension("luasnip")
-- telescope.load_extension("grapple")
-- telescope.load_extension("rails_related_files")
-- telescope.load_extension('send_to_harpoon')
-- telescope.load_extension("undo")
-- telescope.load_extension("vimwiki")
-- telescope.load_extension("fzf")
-- telescope.load_extension("cabinet")

-- TODO: Keymap Strategy
-- {
-- 	"<leader>fc",
-- 	":Telescope cabinet<CR>",
-- 	desc = "Telescope cabinet files",
-- },
-- {
-- 	"<leader>fd",
-- 	":Telescope directory find_files<CR>",
-- 	desc = "Telescope select directory for Find Files",
-- },
-- {
-- 	"<leader>fD",
-- 	function()
-- 		require("telescope").extensions.directory.live_grep()
-- 	end,
-- 	desc = "Telescope select directory for Live Grep",
-- },
-- {
-- 	"<leader>ff",
-- 	function()
-- 		require("telescope.builtin").find_files()
-- 	end,
-- 	desc = "Telescope Find Files",
-- },
-- {
-- 	"<leader>fF",
-- 	function()
-- 		require("telescope.builtin").find_files({ hidden = true })
-- 	end,
-- 	desc = "Telescope Find Files",
-- },
-- {
-- 	"<leader>fg",
-- 	function()
-- 		require("telescope.builtin").live_grep()
-- 	end,
-- 	desc = "Telescope Find Files",
-- },
-- {
-- 	"<leader>fG",
-- 	function()
-- 		require("telescope.builtin").live_grep({ hidden = true })
-- 	end,
-- 	desc = "Telescope Find Files",
-- },
-- {
-- 	"<leader>fR", -- rails rails_related_files
-- 	":Telescope rails_related_files",
-- 	desc = "Telescope Rails Related Files",
-- },
-- {
-- 	"<leader>sh", -- luasnip
-- 	":Telescope help_tags<CR>",
-- 	desc = "Telescope Help Tags",
-- },
-- {
-- 	"<leader>sk", -- keymaps
-- 	":Telescope keymaps<CR>",
-- 	desc = "Telescope Keymaps",
-- },
-- {
-- 	"<leader>sl", -- luasnip
-- 	":Telescope luasnip<CR>",
-- 	desc = "Telescope LuaSnip",
-- },
-- --{
-- --  "<leader>sp",
-- --  function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
-- --  desc = "Find Plugin File",
-- --},
-- --{
-- --  '<leader>su', -- undo list
-- --  ':Telescope undo,
-- --  desc = 'Undo Tree visualization',
-- --},
-- {
-- 	"<Tab>ft",
-- 	":TodoTelescope<CR>",
-- 	desc = "Todo telescop list (All todos)",
-- },
-- {
-- 	"<Tab>fT",
-- 	":TodoQuickFix<CR>",
-- 	desc = "Todo quickfix list (All todos)",
-- },


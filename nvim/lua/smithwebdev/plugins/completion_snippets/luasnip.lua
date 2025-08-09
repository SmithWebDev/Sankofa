local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.setup({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	ext_base_prio = 200,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	override_builtin = true,
	store_selection_keys = "<c-s>",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "#1b1d2b" } }, -- { '<- Current Choice', 'NonTest' }
			},
		},
	},
})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/snippets" })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/utilities/snippets/" })
require("luasnip.loaders.from_snipmate").lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({
  paths = { "~/.config/nvim/lua/smithwebdev/snippets/vscode"}
})

-- ls.filetype_extend("all", { '_' })
ls.filetype_extend("eruby", { "html", "ruby" })
-- ls.filetype_extend("markdown", { "vimwiki" })
ls.filetype_extend("ruby", { "eruby", "rspec" })
ls.filetype_extend("octo", { "markdown" })
-- ls.filetype_extend("vimwiki", { "markdown" })
-- ls.filetype_extend("html", { "eruby" })

------------------------
--      Keymaps       --
------------------------

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(1) then
		ls.expand_or_jump()
	end
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

--vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])
--vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
-- vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()]])
-- vim.keymap.set("n", "<leader>se", ":LuaSnipEdit<CR>", { desc = "Edit LuaSnip", silent = true })

vim.api.nvim_create_user_command("EditSnippets", function()
	local function test_snippet(filename)
		local base_path = vim.fn.stdpath("config") .. "/lua/smithwebdev/snippets/"
		local filetype = vim.bo.filetype
		local test_pattern = "_spec"

		local snippet_file_map = {
			ruby = "rspec",
			javascript = "jest",
		}

		local test_framework = snippet_file_map[filetype]

		if string.match(filename, test_pattern) then
			vim.cmd("edit " .. base_path .. test_framework .. ".lua")
			print("Opening " .. test_framework .. " snippets")
		else
			vim.cmd("edit " .. base_path .. filetype .. ".lua")
			print("Opening " .. filetype .. " snippets")
		end
	end

	local current_filename = vim.fn.expand("%:t")
	test_snippet(current_filename)
end, {})

vim.keymap.set("n", "<leader>sl", ":EditSnippets<CR>", { desc = "Edit LuaSnip", silent = true })


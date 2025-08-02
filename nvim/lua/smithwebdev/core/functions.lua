-- Function to wipe all settable registers
local function wipe_all_registers()
	-- Named registers (a-z)
	for i = string.byte("a"), string.byte("z") do
		pcall(vim.fn.setreg, string.char(i), {}) -- Empty list for full wipe
	end
	-- Numbered registers (0-9)
	for i = 0, 9 do
		pcall(vim.fn.setreg, tostring(i), "") -- Empty string
	end
	-- Small delete register (-)
	pcall(vim.fn.setreg, "-", "")
	-- Search register (/)
	pcall(vim.fn.setreg, "/", "")
	-- Clipboard registers (* and +)
	pcall(vim.fn.setreg, "*", "")
	pcall(vim.fn.setreg, "+", "")
end

-- Custom command to call the function
vim.api.nvim_create_user_command("WipeRegs", wipe_all_registers, {
	desc = "Wipe all settable registers",
})

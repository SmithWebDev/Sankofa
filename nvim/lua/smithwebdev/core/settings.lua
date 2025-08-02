print("SmithWebDev Settings Loaded")

---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  Settings                   --
---[[---------------------------------------]]---

--[[ Completion Options ]]
--
vim.opt.completeopt = "menu,menuone,preview,noselect"
vim.opt.shortmess = "csa" --Adjust short system messages
-- vim.opt.updatetime = 2000
vim.opt.timeout = true
vim.opt.timeoutlen = 300

--[[ Fold Options ]]
--
vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldnestmax = 1
vim.opt.foldenable = true
-- vim.opt.foldlevel = 99
-- vim.o.foldlevelstart = 99
-- vim.opt.foldcolumn = "1"
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

--[[ Indentation Options ]]
--
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2

--[[ Line Options ]]
--
vim.opt.cursorline = false
vim.opt.textwidth = 80
vim.opt.showbreak = "++"
vim.opt.listchars = "tab:→ ,trail:·,extends:…,eol:↩" --space:·,
vim.opt.showbreak = "·+"
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 15
vim.opt.list = true
vim.opt.showmode = false
vim.opt.showtabline = 2

--[[ Search Options ]]
--
vim.opt.path = "**"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

--[[ File ]]
--
vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
--vim.opt.t_Co = '256'
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.opt.undofile = true

--[[ Line Numbering ]]
--
vim.opt.number = true
vim.opt.relativenumber = true

--[[ Window/Buffer/Tab Options ]]
--
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.conceallevel = 2
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.guifont = "FiraCode Nerd Font"
vim.opt.pumheight = 10
vim.opt.pumblend = 25
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.cmd([[:highlight WinSeparator guibg=None]])
vim.opt.completefunc = "emoji#complete"
vim.opt.splitkeep = "screen"

if vim.fn.has("nvim-0.9.0") == 1 then
	vim.opt.shortmess:append({ C = true })
end

--vim.cmd.colorscheme 'oxocarbon-lua'
--vim.cmd 'colorscheme tokyonight'


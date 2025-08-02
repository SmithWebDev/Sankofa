---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                Autocommands                 --
---[[---------------------------------------]]---

--------------------------------------------------------------------------------
--                          Close filetypes with <q>                          --
--------------------------------------------------------------------------------

local Quick_Close = vim.api.nvim_create_augroup("Quick_Close", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = Quick_Close,
  pattern = {
    "neo-tree",
    "guihua",
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "octo",
    "qf",
    "query", -- :InspectTree
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", ":q<cr>", { buffer = event.buf, silent = true })
  end,
})

--------------------------------------------------------------------------------
--                        Automatic Directory Creation                        --
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "VimEnter", "BufNewFile" }, {
  pattern = "*",
  --group = AutoSaveGroup,
  callback = function()
    local dirname = vim.fn.expand("%:h")

    if vim.fn.isdirectory(dirname) == 0 then
      vim.fn.mkdir(dirname)
      print(vim.fn.expand("%:h") .. " directory created.")
    end
  end,
})

--------------------------------------------------------------------------------
--                     AutoSave When Leaving Insert Mode                      --
--------------------------------------------------------------------------------

local AutoSaveGroup = vim.api.nvim_create_augroup("autosave_user_events", { clear = true })
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  group = AutoSaveGroup,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    local modifiable = vim.bo[bufnr].modifiable
    local is_empty_buftype = vim.bo[bufnr].buftype == ""
    local ignorelist = {
      "packer",
      "netrw",
      "TelescopePrompt",
      "lspinfo",
      "lsp-installer",
      "query",
      "tsplayground",
      "text",
      "harpoon",
      "scratch",
    }
    if not vim.tbl_contains(ignorelist, ft) and modifiable and is_empty_buftype then
      vim.cmd("silent write!")
    end
  end,
})

----------------------------
-- Autoswap Mode (I -> N) --
----------------------------
vim.api.nvim_create_autocmd({ "TextChangedI", "InsertEnter" }, {
  group = AutoSaveGroup,
  callback = function()
    if _G.autoleave_timer ~= nil then
      _G.autoleave_timer:stop()

      if not _G.autoleave_timer:is_closing() then
        _G.autoleave_timer:close()
      end
    end
    _G.autoleave_timer = vim.defer_fn(function()
      local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(key, "n", false)
    end, 8000)
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre" }, {
  pattern = "*",
  group = AutoSaveGroup,
  callback = function()
    local ignorelist = {
      "markdown",
    }
    if vim.bo.filetype ~= ignorelist then
      return
    end
    vim.cmd("%s/\\s\\+$//e")
  end,
})

--------------------------------------------------------------------------------
--                        Automatic Directory Creation                        --
--------------------------------------------------------------------------------
--vim.api.nvim_create_autocmd({ "VimEnter", "BufNewFile" }, {
--	pattern = "*",
--	--group = AutoSaveGroup,
--	callback = function()
--		local dirname = vim.fn.expand("%:h")
--
--		if vim.fn.isdirectory(dirname) == 0 then
--			vim.fn.mkdir(dirname)
--			print(vim.fn.expand("%:h") .. " directory created.")
--		end
--	end,
--})
--
--------------------------------------------------------------------------------
--                         Cursorline in Normal mode                          --
--------------------------------------------------------------------------------

local CursorInsertMode = vim.api.nvim_create_augroup("CursorInsertMode", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    -- vim.opt.cursorline = true
  end,
  group = CursorInsertMode,
  desc = "Enable cursorline in normal mode",
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    vim.opt.cursorline = false
  end,
  group = CursorInsertMode,
  desc = "Disable cursorline on insert",
})

--------------------------------------------------------------------------------
--                  Disable foldmethod in specific filetypes                  --
--------------------------------------------------------------------------------

local DisableFold = vim.api.nvim_create_augroup("disable folds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = DisableFold,
  pattern = {
    "TelescopePrompt",
  },
  callback = function()
    vim.opt.foldenable = false
  end,
})

--------------------------------------------------------------------------------
--                            Auto Set Indentation                            --
--------------------------------------------------------------------------------
local Indent2Spaces = vim.api.nvim_create_augroup("2 space indentation", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = Indent2Spaces,
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

--------------------------------------------------------------------------------
--                       Obsidian Dataview Key Conceal                        --
--------------------------------------------------------------------------------
local ObsidianCommands = vim.api.nvim_create_augroup("user commands", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = ObsidianCommands,
  pattern = "markdown",
  callback = function()
    vim.cmd [[
            syntax match DataviewInlineTag /^\s*\w\+::\s\+.*$/
            highlight Conceal ctermfg=gray guifg=gray
            set conceallevel=2 concealcursor=nvic
            ]]
    vim.api.nvim_set_hl(0, "DataviewInlineTag", { link = "Conceal" })
  end,
})

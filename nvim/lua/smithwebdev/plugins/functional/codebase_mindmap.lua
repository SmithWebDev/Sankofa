require("codebase-mindmap").setup()
-- { "<leader>mf", "<cmd>CodebaseMindmapFunction<cr>", desc = "Show function call graph" },
-- { "<leader>mm", "<cmd>CodebaseMindmapOverview<cr>", desc = "Show file overview" },
vim.keymap.set('n', '<leader>cmf', '<cmd>CodebaseMindmapFunction<cr>', { desc = "Show function call graph", silent = true, noremap = true })

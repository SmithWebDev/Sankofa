require'fyler'.setup({
  icon_provider = "nvim-web-devicons",
  mappings = {
    explorer = {
      ["<Space>e"] = "CloseView",
    },
  },
  views = {
    explorer = {
      close_on_select = true,
      confirm_simple = true,
      default_explorer = true,
      win = {
        kind_presets = {
          split_left_most = {
            width = "0.25rel",
          },
        },
        win_opts = {
          number = false,
          relativenumber = true,
        },
      },
    },
  },
})

vim.keymap.set('n', '<leader>fy', '<cmd>Fyler kind=float<CR>', { desc = 'Open Fyler', silent = true, noremap = true })
vim.keymap.set('n', "<leader>e", "<cmd>Fyler kind=split_left_most<CR>", { desc = 'Open Fyler', silent = true, noremap = true })

vim.o.foldenable=false
